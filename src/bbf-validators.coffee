###
  Backbone-Forms validators 1.0.1

  Copyright (c) 2016 Tomasz Jakub Rup

  https://github.com/tomi77/backbone-forms-validators

  Released under the MIT license
###

((root, factory) ->
  ### istanbul ignore next ###
  switch
    when typeof define is 'function' and define.amd
      define ['underscore', 'backbone-forms'], factory
    when typeof exports is 'object'
      factory require('underscore'), require('backbone-forms')
    else
      factory root._, root.Backbone.Form
  return
) @, (_, Form) ->
  Form.validators.multiple = (options) ->
    options = _.extend
      separator: ';'
    , options

    base_validator = Form.validators[options.base_type] options

    (value) ->
      value = null if value.trim() is ''

      # Don't check empty values (add a 'required' validator for this)
      unless value? then return

      options.value = value

      value = value.split(options.separator).map (email) -> email.trim()

      out = _.compact _.map value, base_validator
      if out.length > 0
        type: options.base_type
        message: options.message or out[0].message

  Form.validators.errMessages.phone = 'Incorrect phone number'
  Form.validators.phone = (options) ->
    options = _.extend
      type: 'phone'
      message: Form.validators.errMessages.phone
      regexp: /// ^
        (?:
          (?:
            \(? (?: 00 | \+ ) (?: [1-4]\d{2} | [1-9]\d? ) \)?
          )?
          [\-\.\ \\\/]?
        )?
        (?:
          \(? \d+ \)? [\-\.\ \\\/]?
        )+
        (?:
          [\-\.\ \\\/]?
          (?: \# | ext\.? | extension | x )
          [\-\.\ \\\/]?
          \d+
        )?
        $ ///
    , options

    Form.validators.regexp options

  Form.validators.errMessages.minlength = _.template 'The minimum length is <%= minlength %> characters', null, Form.templateSettings
  Form.validators.minlength = (options) ->
    options = _.extend
      type: 'minlength'
      maxlength: 0
      message: Form.validators.errMessages.minlength
    , options
    options.regexp = new RegExp "^.{#{ options.minlength },}$"

    Form.validators.regexp options

  Form.validators.errMessages.maxlength = _.template 'The maximum length is <%= maxlength %> characters', null, Form.templateSettings
  Form.validators.maxlength = (options) ->
    options = _.extend
      type: 'maxlength'
      maxlength: 0
      message: Form.validators.errMessages.maxlength
    , options
    options.regexp = new RegExp "^.{0,#{ options.maxlength }}$"

    Form.validators.regexp options

  Form.validators.errMessages.table_weights = 'Invalid control code'
  Form.validators.table_weights = (options) ->
    options = _.extend
      type: 'table_weights'
      message: Form.validators.errMessages.table_weights
    , options

    unless options.lengths?
      throw new Error 'Option "lengths" is required'
    options.lengths = [options.lengths] unless _.isArray options.lengths

    unless options.weights?
      throw new Error 'Option "weights" is required'

    unless options.modulo_values? and _.isArray options.modulo_values
      throw new Error 'Option "modulo_values" is required'

    if _.isArray options.weights
      if options.lengths.length is 1
        options.weights = _.object [options.lengths[0]], [options.weights]
      else
        throw new Error 'Incorrect options weights and lengths'

    options.excepts = [options.excepts] unless _.isArray options.excepts

    (value) ->
      value = null if value.trim() is ''

      # Don't check empty values (add a 'required' validator for this)
      unless value? then return

      options.value = value

      err = type: options.type, message: options.message

      value = value.replace /[\s-]/g, ''
      if value in options.excepts then return err
      value = value.split ''
      unless value.length in options.lengths then return err

      control = value.pop()
      sum = _.reduce _.zip(value, options.weights[value.length + 1]),
        (memo, val) -> memo + val[1] * parseInt val[0], 10
      , 0
      value = '' + options.modulo_values[sum % options.modulo_values.length]
      unless value is control then err

  return

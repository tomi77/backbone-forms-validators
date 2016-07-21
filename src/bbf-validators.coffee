###
  Backbone-Forms validators 1.0.0

  Copyright (c) 2016 Tomasz Jakub Rup

  https://github.com/tomi77/backbone-forms-validators

  Released under the MIT license
###

((root, factory) ->
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

  return

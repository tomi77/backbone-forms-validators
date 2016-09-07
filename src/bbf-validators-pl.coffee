###
  Backbone-Forms validators PL 0.1.0

  Copyright (c) 2016 Tomasz Jakub Rup

  https://github.com/tomi77/backbone-forms-validators

  Released under the MIT license
###

((root, factory) ->
  ###
  istanbul ignore next
  ###
  switch
    when typeof define is 'function' and define.amd
      define ['underscore', 'backbone-forms'], factory
    when typeof exports is 'object'
      factory require('underscore'), require('backbone-forms')
    else
      factory root._, root.Backbone.Form
  return
) @, (_, Form) ->
  Form.validators.errMessages.nip = 'Invalid NIP'
  Form.validators.nip = (options) ->
    options = _.extend
      type: 'nip'
      message: Form.validators.errMessages.nip
    , options

    (value) ->
      value = null if value.trim() is ''

      # Don't check empty values (add a 'required' validator for this)
      unless value? then return

      options.value = value

      err = type: options.type, message: options.message

      value = value.replace /[\s-]/g, ''
      unless value.length is 10 and parseInt(value, 10) > 0 then return err

      value = value.split('').map (val) -> parseInt val, 10
      control = value.pop()
      weights = [6, 5, 7, 2, 3, 4, 5, 6, 7]
      sum = _.reduce _.zip(value, weights),
        (memo, val) -> memo + val[0] * val[1]
      , 0
      value = sum % 11
      value = 0 if value is 10
      unless value is control then err

  Form.validators.errMessages.pesel = 'Invalid Pesel'
  Form.validators.pesel = (options) ->
    options = _.extend
      type: 'pesel'
      message: Form.validators.errMessages.pesel
    , options

    (value) ->
      value = null if value.trim() is ''

      # Don't check empty values (add a 'required' validator for this)
      unless value? then return

      options.value = value

      err = type: options.type, message: options.message

      value = value.replace /[\s-]/g, ''
      unless value.length is 11 and parseInt(value, 10) > 0 then return err

      value = value.split('').map (val) -> parseInt val, 10
      control = value.pop()
      weights = [9, 7, 3, 1, 9, 7, 3, 1, 9, 7]
      sum = _.reduce _.zip(value, weights),
        (memo, val) -> memo + val[0] * val[1]
      , 0
      value = sum % 10
      unless value is control then err

  return

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
  Form.validators.emails = (options) ->
    options = _.extend
      type: 'emails'
      message: 'Correct e-mail addresses. Addresses split the semicolon'
      regexp: /^[\w\-]+([\w\-\+.][\w\-]+)*[@][\w\-]+([.]([\w\-]+)){1,3}$/
      separator: ';'
    , options

    (value) ->
      value = null if value.trim() is ''

      # Don't check empty values (add a 'required' validator for this)
      unless value? then return

      options.value = value

      value = value.split(options.separator).map (email) -> email.trim()

      unless _.all value, options.regexp.test, options.regexp
        type: options.type
        message: options.message

  return

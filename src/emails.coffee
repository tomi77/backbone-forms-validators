define ['underscore', 'backbone', 'backbone-forms'], (_, Backbone) ->
  Backbone.Form.validators.emails = (options) ->
    options = _.extend
      type: 'emails'
      message: 'Correct e-mail addresses. Addresses split the semicolon'
      regexp: /^[\w\-]+([\w\-\+.][\w\-]+)*[@][\w\-]+([.]([\w\-]+)){1,3}$/
      separator: ';'
    , options

    (value) ->
      value = null if value.trim() is ''

      options.value = value

      # Don't check empty values (add a 'required' validator for this)
      unless value? then return

      value = value.split options.separator
      value = value.map (email) -> email.trim()

      unless _.all(value, (email) -> options.regexp.test email)
        type: options.type
        message: options.message

  return

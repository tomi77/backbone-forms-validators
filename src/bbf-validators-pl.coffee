###
  Backbone-Forms validators PL 0.2.0

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
      define ['underscore', 'backbone-forms', 'backbone-forms-validators'], factory
    when typeof exports is 'object'
      factory require('underscore'), require('backbone-forms'), require('backbone-forms-validators')
    else
      factory root._, root.Backbone.Form
  return
) @, (_, Form) ->
  Form.validators.errMessages.nip = 'Invalid NIP'
  Form.validators.nip = (options) ->
    options = _.extend
      type: 'nip'
      message: Form.validators.errMessages.nip
    , options,
      lengths: 10
      weights: [6, 5, 7, 2, 3, 4, 5, 6, 7]
      modulo_values: [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 0]
      excepts: '0000000000'

    Form.validators.table_weights options

  Form.validators.errMessages.pesel = 'Invalid Pesel'
  Form.validators.pesel = (options) ->
    options = _.extend
      type: 'pesel'
      message: Form.validators.errMessages.pesel
    , options,
      lengths: 11
      weights: [9, 7, 3, 1, 9, 7, 3, 1, 9, 7]
      modulo_values: [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
      excepts: '00000000000'

    Form.validators.table_weights options

  Form.validators.errMessages.regon = 'Invalid REGON'
  Form.validators.regon = (options) ->
    options = _.extend
      type: 'regon'
      message: Form.validators.errMessages.regon
    , options,
      lengths: [7, 9, 14]
      weights:
        7: [2, 3, 4, 5, 6, 7]
        9: [8, 9, 2, 3, 4, 5, 6, 7]
        14: [2, 4, 8, 5, 0, 9, 7, 3, 6, 1, 2, 4, 8]
      modulo_values: [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 0]
      excepts: '000000000'

    Form.validators.table_weights options

  return

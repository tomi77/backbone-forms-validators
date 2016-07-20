
/*
  Backbone-Forms validators 1.0.0

  Copyright (c) 2016 Tomasz Jakub Rup

  https://github.com/tomi77/backbone-forms-validators

  Released under the MIT license
 */
(function(root, factory) {
  switch (false) {
    case !(typeof define === 'function' && define.amd):
      define(['underscore', 'backbone-forms'], factory);
      break;
    case typeof exports !== 'object':
      factory(require('underscore'), require('backbone-forms'));
      break;
    default:
      factory(root._, root.Backbone.Form);
  }
})(this, function(_, Form) {
  Form.validators.emails = function(options) {
    options = _.extend({
      type: 'emails',
      message: 'Correct e-mail addresses. Addresses split the semicolon',
      regexp: /^[\w\-]+([\w\-\+.][\w\-]+)*[@][\w\-]+([.]([\w\-]+)){1,3}$/,
      separator: ';'
    }, options);
    return function(value) {
      if (value.trim() === '') {
        value = null;
      }
      if (value == null) {
        return;
      }
      options.value = value;
      value = value.split(options.separator).map(function(email) {
        return email.trim();
      });
      if (!_.all(value, options.regexp.test, options.regexp)) {
        return {
          type: options.type,
          message: options.message
        };
      }
    };
  };
  Form.validators.phone = function(options) {
    options = _.extend({
      type: 'phone',
      message: 'Incorrect phone number',
      regexp: /^(?:(?:\(?(?:00|\+)([1-4]\d\d|[1-9]\d?)\)?)?[\-\.\ \\\/]?)?((?:\(?\d{1,}\)?[\-\.\ \\\/]?){0,})(?:[\-\.\ \\\/]?(?:#|ext\.?|extension|x)[\-\.\ \\\/]?(\d+))?$/
    }, options);
    return Form.validators.regexp(options);
  };
});

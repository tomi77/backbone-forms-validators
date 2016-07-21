
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
  Form.validators.multiple = function(options) {
    var base_validator;
    options = _.extend({
      separator: ';'
    }, options);
    base_validator = Form.validators[options.base_type](options);
    return function(value) {
      var out;
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
      out = _.compact(_.map(value, base_validator));
      if (out.length > 0) {
        return {
          type: options.base_type,
          message: options.message || out[0].message
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
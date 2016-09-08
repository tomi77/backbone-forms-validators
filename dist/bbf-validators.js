
/*
  Backbone-Forms validators 0.2.0

  Copyright (c) 2016 Tomasz Jakub Rup

  https://github.com/tomi77/backbone-forms-validators

  Released under the MIT license
 */
(function(root, factory) {

  /* istanbul ignore next */
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
  Form.validators.errMessages.phone = 'Incorrect phone number';
  Form.validators.phone = function(options) {
    options = _.extend({
      type: 'phone',
      message: Form.validators.errMessages.phone,
      regexp: /^(?:(?:\(?(?:00|\+)(?:[1-4]\d{2}|[1-9]\d?)\)?)?[\-\. \\\/]?)?(?:\(?\d+\)?[\-\. \\\/]?)+(?:[\-\. \\\/]?(?:\#|ext\.?|extension|x)[\-\. \\\/]?\d+)?$/
    }, options);
    return Form.validators.regexp(options);
  };
  Form.validators.errMessages.maxlength = _.template('The maximum length is <%= maxlength %> characters', null, Form.templateSettings);
  Form.validators.maxlength = function(options) {
    options = _.extend({
      type: 'maxlength',
      maxlength: 0,
      message: Form.validators.errMessages.maxlength
    }, options);
    options.regexp = new RegExp("^.{0," + options.maxlength + "}$");
    return Form.validators.regexp(options);
  };
});

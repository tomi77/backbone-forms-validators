
/*
  Backbone-Forms validators 0.2.0

  Copyright (c) 2016 Tomasz Jakub Rup

  https://github.com/tomi77/backbone-forms-validators

  Released under the MIT license
 */
var indexOf = [].indexOf || function(item) { for (var i = 0, l = this.length; i < l; i++) { if (i in this && this[i] === item) return i; } return -1; };

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
  Form.validators.errMessages.table_weights = 'Invalid control code';
  Form.validators.table_weights = function(options) {
    options = _.extend({
      type: 'table_weights',
      message: Form.validators.errMessages.table_weights
    }, options);
    if (options.lengths == null) {
      throw new Error('Option "lengths" is required');
    }
    if (!_.isArray(options.lengths)) {
      options.lengths = [options.lengths];
    }
    if (options.weights == null) {
      throw new Error('Option "weights" is required');
    }
    if (!((options.modulo_values != null) && _.isArray(options.modulo_values))) {
      throw new Error('Option "modulo_values" is required');
    }
    if (_.isArray(options.weights)) {
      if (options.lengths.length === 1) {
        options.weights = _.object([options.lengths[0]], [options.weights]);
      } else {
        throw new Error('Incorrect options weights and lengths');
      }
    }
    if (!_.isArray(options.excepts)) {
      options.excepts = [options.excepts];
    }
    return function(value) {
      var control, err, ref, sum;
      if (value.trim() === '') {
        value = null;
      }
      if (value == null) {
        return;
      }
      options.value = value;
      err = {
        type: options.type,
        message: options.message
      };
      value = value.replace(/[\s-]/g, '');
      if (indexOf.call(options.excepts, value) >= 0) {
        return err;
      }
      value = value.split('');
      if (ref = value.length, indexOf.call(options.lengths, ref) < 0) {
        return err;
      }
      control = value.pop();
      sum = _.reduce(_.zip(value, options.weights[value.length + 1]), function(memo, val) {
        return memo + val[1] * parseInt(val[0], 10);
      }, 0);
      value = '' + options.modulo_values[sum % options.modulo_values.length];
      if (value !== control) {
        return err;
      }
    };
  };
});

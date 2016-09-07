
/*
  Backbone-Forms validators PL 0.1.0

  Copyright (c) 2016 Tomasz Jakub Rup

  https://github.com/tomi77/backbone-forms-validators

  Released under the MIT license
 */
(function(root, factory) {

  /*
  istanbul ignore next
   */
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
  Form.validators.errMessages.nip = 'Invalid NIP';
  Form.validators.nip = function(options) {
    options = _.extend({
      type: 'nip',
      message: Form.validators.errMessages.nip
    }, options);
    return function(value) {
      var control, err, sum, weights;
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
      if (!(value.length === 10 && parseInt(value, 10) > 0)) {
        return err;
      }
      value = value.split('').map(function(val) {
        return parseInt(val, 10);
      });
      control = value.pop();
      weights = [6, 5, 7, 2, 3, 4, 5, 6, 7];
      sum = _.reduce(_.zip(value, weights), function(memo, val) {
        return memo + val[0] * val[1];
      }, 0);
      value = sum % 11;
      if (value === 10) {
        value = 0;
      }
      if (value !== control) {
        return err;
      }
    };
  };
  Form.validators.errMessages.pesel = 'Invalid Pesel';
  Form.validators.pesel = function(options) {
    options = _.extend({
      type: 'pesel',
      message: Form.validators.errMessages.pesel
    }, options);
    return function(value) {
      var control, err, sum, weights;
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
      if (!(value.length === 11 && parseInt(value, 10) > 0)) {
        return err;
      }
      value = value.split('').map(function(val) {
        return parseInt(val, 10);
      });
      control = value.pop();
      weights = [9, 7, 3, 1, 9, 7, 3, 1, 9, 7];
      sum = _.reduce(_.zip(value, weights), function(memo, val) {
        return memo + val[0] * val[1];
      }, 0);
      value = sum % 10;
      if (value !== control) {
        return err;
      }
    };
  };
  Form.validators.errMessages.regon = 'Invalid REGON';
  Form.validators.regon = function(options) {
    options = _.extend({
      type: 'regon',
      message: Form.validators.errMessages.regon
    }, options);
    return function(value) {
      var control, err, ref, sum, weights;
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
      if (!(((ref = value.length) === 7 || ref === 9 || ref === 14) && parseInt(value, 10) > 0)) {
        return err;
      }
      value = value.split('').map(function(val) {
        return parseInt(val, 10);
      });
      control = value.pop();
      weights = (function() {
        switch (value.length) {
          case 6:
            return [2, 3, 4, 5, 6, 7];
          case 8:
            return [8, 9, 2, 3, 4, 5, 6, 7];
          case 13:
            return [2, 4, 8, 5, 0, 9, 7, 3, 6, 1, 2, 4, 8];
        }
      })();
      sum = _.reduce(_.zip(value, weights), function(memo, val) {
        return memo + val[0] * val[1];
      }, 0);
      value = sum % 11;
      if (value === 10) {
        value = 0;
      }
      if (value !== control) {
        return err;
      }
    };
  };
});

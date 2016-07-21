
/*
  Backbone-Forms validators PL 1.0.0

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
      if (value !== control) {
        return err;
      }
    };
  };
});

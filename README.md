# Backbone-Forms validators

[![Build Status](https://travis-ci.org/tomi77/backbone-forms-validators.svg?branch=master)](https://travis-ci.org/tomi77/backbone-forms-validators)
[![Coverage Status](https://coveralls.io/repos/github/tomi77/backbone-forms-validators/badge.svg)](https://coveralls.io/github/tomi77/backbone-forms-validators)
[![Code Climate](https://codeclimate.com/github/tomi77/backbone-forms-validators/badges/gpa.svg)](https://codeclimate.com/github/tomi77/backbone-forms-validators)
[![Dependency Status](https://david-dm.org/tomi77/backbone-forms-validators.png)](https://david-dm.org/tomi77/backbone-forms-validators)
[![devDependencies Status](https://david-dm.org/tomi77/backbone-forms-validators/dev-status.svg)](https://david-dm.org/tomi77/backbone-forms-validators?type=dev)
![Downloads](https://img.shields.io/npm/dt/backbone-forms-validators.svg)

A set of [Backbone-Forms](https://github.com/powmedia/backbone-forms) validators

## Installation

~~~bash
bower install backbone-forms-validators
~~~

or

~~~bash
npm install backbone-forms-validators
~~~

## Usage

### RequireJS

Add packages to config file:

~~~js
packages: [{
  name: 'backbone-forms-validators',
  location: 'bower_components/backbone-forms-validators',
  main: 'bbf-validators'
}]
~~~

Use:

~~~js
define['backbone-forms-validators', 'backbone-forms-validators/pl'], function(Backbone, Form) {
  // Your code
}
~~~

### Vanilla JS

~~~html
<script type="text/javascript" src="bower_components/backbone-forms-validators/bbf-validators.js"></script>
<script type="text/javascript" src="bower_components/backbone-forms-validators/pl.js"></script>

<!-- Rest od code -->
~~~

### Webpack

~~~js
require('backbone-forms-validators')
require('backbone-forms-validators/pl')

// Rest of code
~~~

## Validators

### multiple

~~~js
var form = new Backbone.Form({
  schema: {
    emails: {
      type: 'Text',
      validators: [{
        type: 'multiple',
        base_type: 'email',
        separator: ',',
        message: 'Emails separated by colon'
      }]
    }
  }
});
~~~

[Demo](https://tomi77.github.io/backbone-forms-validators/multiple.html)

### phone

Validates phone number

~~~js
var form = new Backbone.Form({
  schema: {
    phone: {
      type: 'Text',
      validators: ['phone']
    }
  }
});
~~~

[Demo](https://tomi77.github.io/backbone-forms-validators/phone.html)

### minlength

Validates length of entered text

~~~js
var form = new Backbone.Form({
  schema: {
    text: {
      type: 'Text',
      validators: [{
        type: 'minlength',
        minlength: 3
      }]
    }
  }
});
~~~

[Demo](https://tomi77.github.io/backbone-forms-validators/minlength.html)

### maxlength

Validates length of entered text

~~~js
var form = new Backbone.Form({
  schema: {
    text: {
      type: 'Text',
      validators: [{
        type: 'maxlength',
        maxlength: 9
      }]
    }
  }
});
~~~

[Demo](https://tomi77.github.io/backbone-forms-validators/maxlength.html)

### nip

Validates NIP (Polish tax identification number)

~~~js
var form = new Backbone.Form({
  schema: {
    nip: {
      type: 'Text',
      validators: ['nip']
    }
  }
});
~~~

[Demo](https://tomi77.github.io/backbone-forms-validators/nip.html)

### pesel

Validates Pesel (Polish identification number)

~~~js
var form = new Backbone.Form({
  schema: {
    pesel: {
      type: 'Text',
      validators: ['pesel']
    }
  }
});
~~~

[Demo](https://tomi77.github.io/backbone-forms-validators/pesel.html)

### regon

Validates REGON (Polish Taxpayer Identification Number)

~~~js
var form = new Backbone.Form({
  schema: {
    regon: {
      type: 'Text',
      validators: ['regon']
    }
  }
});
~~~

[Demo](https://tomi77.github.io/backbone-forms-validators/regon.html)

# Backbone-Forms validators

[![Build Status](https://travis-ci.org/tomi77/backbone-forms-validators.svg?branch=master)](https://travis-ci.org/tomi77/backbone-forms-validators)
[![Coverage Status](https://coveralls.io/repos/github/tomi77/backbone-forms-validators/badge.svg?branch=master)](https://coveralls.io/github/tomi77/backbone-forms-validators?branch=master)
[![Code Climate](https://codeclimate.com/github/tomi77/backbone-forms-validators/badges/gpa.svg)](https://codeclimate.com/github/tomi77/backbone-forms-validators)

A set of Backbone-Forms validators

## Installation

~~~bash
bower install backbone-forms-validators
~~~

## Validators

### multiple

~~~coffee-script
Model = new Backbone.Model
  schema:
    nip:
      type: 'Text'
      validators: [
        type: 'multiple'
        base_type: 'number'
        separator: ','
        message: 'Numbers separated by colon'
      ]

model = new Model()

form = new Backbone.Form
  model: model
~~~

### phone

Validates phone numbers

~~~coffee-script
Model = new Backbone.Model
  schema:
    nip:
      type: 'Text'
      validators: ['phone']

model = new Model()

form = new Backbone.Form
  model: model
~~~

### nip

Validates NIP (Polish tax identification number)

~~~coffee-script
Model = new Backbone.Model
  schema:
    nip:
      type: 'Text'
      validators: ['nip']

model = new Model()

form = new Backbone.Form
  model: model
~~~

## Demo

https://tomi77.github.io/backbone-forms-validators/

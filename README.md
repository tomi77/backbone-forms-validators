# Backbone-Forms validators

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

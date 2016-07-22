# Backbone-Forms validators

[![Build Status](https://travis-ci.org/tomi77/backbone-forms-validators.svg?branch=master)](https://travis-ci.org/tomi77/backbone-forms-validators)
[![Coverage Status](https://coveralls.io/repos/github/tomi77/backbone-forms-validators/badge.svg)](https://coveralls.io/github/tomi77/backbone-forms-validators)
[![Code Climate](https://codeclimate.com/github/tomi77/backbone-forms-validators/badges/gpa.svg)](https://codeclimate.com/github/tomi77/backbone-forms-validators)

A set of Backbone-Forms validators

## Installation

~~~bash
bower install backbone-forms-validators
~~~

## Validators

### multiple

~~~coffee-script
form = new Backbone.Form
  schema:
    emails:
      type: 'Text'
      validators: [
        type: 'multiple'
        base_type: 'email'
        separator: ','
        message: 'Emails separated by colon'
      ]
~~~

[Demo](https://tomi77.github.io/backbone-forms-validators/multiple.html)

### phone

Validates phone number

~~~coffee-script
form = new Backbone.Form
  schema:
    phone:
      type: 'Text'
      validators: ['phone']
~~~

[Demo](https://tomi77.github.io/backbone-forms-validators/phone.html)

### nip

Validates NIP (Polish tax identification number)

~~~coffee-script
form = new Backbone.Form
  schema:
    nip:
      type: 'Text'
      validators: ['nip']
~~~

[Demo](https://tomi77.github.io/backbone-forms-validators/nip.html)

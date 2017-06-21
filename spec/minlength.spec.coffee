describe 'A min length validator', () ->
  validator = Backbone.Form.validators.minlength minlength: 3

  it 'should validate correct length', () ->
    expect(validator '123').toBeUndefined()
    expect(validator '1234').toBeUndefined()

  it 'should validate incorrect length', () ->
    expect(validator '1').toEqual
      type: 'minlength'
      message: Backbone.Form.validators.errMessages.minlength minlength: 3
    expect(validator '12').toEqual
      type: 'minlength'
      message: Backbone.Form.validators.errMessages.minlength minlength: 3

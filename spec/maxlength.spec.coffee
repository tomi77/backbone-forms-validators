describe 'A max length validator', () ->
  validator = Backbone.Form.validators.maxlength maxlength: 9

  it 'should validate correct length', () ->
    expect(validator '12345678').toBeUndefined()
    expect(validator '123456789').toBeUndefined()

  it 'should validate incorrect length', () ->
    expect(validator '1234567890').toEqual
      type: 'maxlength'
      message: Backbone.Form.validators.errMessages.maxlength maxlength: 9

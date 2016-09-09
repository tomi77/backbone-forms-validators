describe 'A REGON validator', () ->
  validator = Backbone.Form.validators.regon()

  it 'should validate correct REGON', () ->
    expect(validator '590096454').toBeUndefined()
    expect(validator '123456785').toBeUndefined()
    expect(validator '12345678512347').toBeUndefined()

  it 'should validate incorrect REGON', () ->
    expect(validator '000000000').toEqual type: 'regon', message: Backbone.Form.validators.errMessages.regon
    expect(validator '590096455').toEqual type: 'regon', message: Backbone.Form.validators.errMessages.regon

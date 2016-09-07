describe 'A REGON validator', () ->
  validator = Backbone.Form.validators.regon()

  it 'should validate correct REGON', () ->
    expect(validator '590096454').toBeUndefined()
    expect(validator '123456785').toBeUndefined()
    expect(validator '12345678512347').toBeUndefined()

  it 'should validate incorrect REGON 000000000', () ->
    verify = validator '000000000'
    expect(verify).toBeDefined()
    expect(verify.type).toBe('regon')
    expect(verify.message).toBe(Backbone.Form.validators.errMessages.regon)

  it 'should validate incorrect REGON 590096455', () ->
    verify = validator '590096455'
    expect(verify).toBeDefined()
    expect(verify.type).toBe('regon')
    expect(verify.message).toBe(Backbone.Form.validators.errMessages.regon)

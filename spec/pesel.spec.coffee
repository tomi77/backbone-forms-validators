describe 'A Pesel validator', () ->
  validator = Backbone.Form.validators.pesel()

  it 'should validate correct Pesel', () ->
    expect(validator '49040501580').toBeUndefined()
    expect(validator '74021834018').toBeUndefined()
    expect(validator '74021834025').toBeUndefined()
    expect(validator '74021834001').toBeUndefined()

  it 'should validate incorrect Pesel 00000000000', () ->
    verify = validator '00000000000'
    expect(verify).toBeDefined()
    expect(verify.type).toBe('pesel')
    expect(verify.message).toBe(Backbone.Form.validators.errMessages.pesel)

  it 'should validate incorrect Pesel 74021834012', () ->
    verify = validator '74021834012'
    expect(verify).toBeDefined()
    expect(verify.type).toBe('pesel')
    expect(verify.message).toBe(Backbone.Form.validators.errMessages.pesel)

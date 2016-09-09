describe 'A Pesel validator', () ->
  validator = Backbone.Form.validators.pesel()

  it 'should validate correct Pesel', () ->
    expect(validator '49040501580').toBeUndefined()
    expect(validator '74021834018').toBeUndefined()
    expect(validator '74021834025').toBeUndefined()
    expect(validator '74021834001').toBeUndefined()

  it 'should validate incorrect Pesel', () ->
    expect(validator '00000000000').toEqual type: 'pesel', message: Backbone.Form.validators.errMessages.pesel
    expect(validator '74021834012').toEqual type: 'pesel', message: Backbone.Form.validators.errMessages.pesel

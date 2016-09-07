describe 'A NIP validator', () ->
  validator = Backbone.Form.validators.nip()

  it 'should validate correct NIP', () ->
    expect(validator '768-000-24-66').toBeUndefined()
    expect(validator '123-456-32-18').toBeUndefined()
    expect(validator '106-00-00-062').toBeUndefined()
    expect(validator '1234567890').toBeUndefined()

  it 'should validate incorrect NIP 000-000-00-00', () ->
    expect(validator '000-000-00-00').toBeDefined()
    expect(validator('000-000-00-00').type).toBe('nip')
    expect(validator('000-000-00-00').message).toBe(Backbone.Form.validators.errMessages.nip)

  it 'should validate incorrect NIP 123-456-78-90', () ->
    expect(validator '123-456-78-90').toBeDefined()
    expect(validator('123-456-78-90').type).toBe('nip')
    expect(validator('123-456-78-90').message).toBe(Backbone.Form.validators.errMessages.nip)

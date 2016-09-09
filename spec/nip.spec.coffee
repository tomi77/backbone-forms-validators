describe 'A NIP validator', () ->
  validator = Backbone.Form.validators.nip()

  it 'should validate correct NIP', () ->
    expect(validator '768-000-24-66').toBeUndefined()
    expect(validator '123-456-32-18').toBeUndefined()
    expect(validator '106-00-00-062').toBeUndefined()
    expect(validator '1234567890').toBeUndefined()

  it 'should validate incorrect NIP', () ->
    expect(validator '000-000-00-00').toEqual type: 'nip', message: Backbone.Form.validators.errMessages.nip
    expect(validator '123-456-78-91').toEqual type: 'nip', message: Backbone.Form.validators.errMessages.nip

describe 'A multiple validator', () ->
  validator_default = Backbone.Form.validators.multiple
    base_type: 'email'

  validator_colon = Backbone.Form.validators.multiple
    base_type: 'email'
    separator: ','

  validator_message = Backbone.Form.validators.multiple
    base_type: 'email'
    message: 'Invalid'

  describe 'should handle single value', () ->
    it 'with default message', () ->
      expect(validator_default 'test@example.com').toBeUndefined()
      expect(validator_colon 'test@example.com').toBeUndefined()
      expect(validator_default 'test@example').toEqual type: 'email', message: Backbone.Form.validators.errMessages.email

    it 'with own message', () ->
      expect(validator_message 'test@example.com').toBeUndefined()
      expect(validator_message 'test@example').toEqual type: 'email', message: 'Invalid'

  describe 'should handle multiple values', () ->
    it 'with default message', () ->
      expect(validator_default 'test@example.com;other@example.com').toBeUndefined()
      expect(validator_colon 'test@example.com,other@example.com').toBeUndefined()
      expect(validator_default 'test@example.com;test@example').toEqual type: 'email', message: Backbone.Form.validators.errMessages.email

    it 'with own message', () ->
      expect(validator_message 'test@example.com;other@example.com').toBeUndefined()
      expect(validator_message 'test@example.com;test@example').toEqual type: 'email', message: 'Invalid'

describe 'A multiple validator', () ->
  validator_default = Backbone.Form.validators.multiple
    base_type: 'number'
  validator_colon = Backbone.Form.validators.multiple
    base_type: 'number'
    separator: ','
  validator_message = Backbone.Form.validators.multiple
    base_type: 'number'
    message: 'Invalid'

  describe 'should handle single value', () ->
    it 'with default message', () ->
      expect(validator_default '123').toBeUndefined()
      expect(validator_colon '123').toBeUndefined()
      expect(validator_default 'qaz').toBeDefined()
      expect(validator_default('qaz').type).toBe('number')
      expect(validator_default('qaz').message).toBe(Backbone.Form.validators.errMessages.number)

    it 'with own message', () ->
      expect(validator_message '123').toBeUndefined()
      expect(validator_message 'qaz').toBeDefined()
      expect(validator_message('qaz').type).toBe('number')
      expect(validator_message('qaz').message).toBe('Invalid')

  describe 'should handle multiple values', () ->
    it 'with default message', () ->
      expect(validator_default '123;456').toBeUndefined()
      expect(validator_colon '123,456').toBeUndefined()
      expect(validator_default '123;qaz').toBeDefined()
      expect(validator_default('123;qaz').type).toBe('number')
      expect(validator_default('123;qaz').message).toBe(Backbone.Form.validators.errMessages.number)

    it 'with own message', () ->
      expect(validator_message '123;456').toBeUndefined()
      expect(validator_message '123;qaz').toBeDefined()
      expect(validator_message('123;qaz').type).toBe('number')
      expect(validator_message('123;qaz').message).toBe('Invalid')

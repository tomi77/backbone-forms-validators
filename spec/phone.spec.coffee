describe 'A phone validator', () ->
  validator = Backbone.Form.validators.phone()

  describe 'should validate phone numbers in', () ->
    it 'E164 format', () ->
      expect(validator '+12345678901').toBeUndefined()
      expect(validator '+61299999999').toBeUndefined()

    it 'original format', () ->
      expect(validator '(234) 567-8901 ext. 123').toBeUndefined()
      expect(validator '61 2 9999 9999').toBeUndefined()
      expect(validator '(416)555-3456').toBeUndefined()
      expect(validator '(123)8575973').toBeUndefined()
      expect(validator '(926) 1234567').toBeUndefined()

    it 'national format', () ->
      expect(validator '(234) 567-8901 ext. 123').toBeUndefined()
      expect(validator '(02) 9999 9999').toBeUndefined()

    it 'international format', () ->
      expect(validator '+1 234-567-8901 ext. 123').toBeUndefined()
      expect(validator '+61 2 9999 9999').toBeUndefined()
      expect(validator '+42 555.123.4567').toBeUndefined()
      expect(validator '+1-(800)-123-4567').toBeUndefined()
      expect(validator '+7 555 1234567').toBeUndefined()
      expect(validator '+7(926)1234567').toBeUndefined()

    it 'out-of-country format from US', () ->
      expect(validator '1 (234) 567-8901 ext. 123').toBeUndefined()
      expect(validator '011 61 2 9999 9999').toBeUndefined()
      expect(validator '1 (234) 567-8901').toBeUndefined()
      expect(validator '1-234-567-8901 x1234').toBeUndefined()
      expect(validator '1-234-567-8901 ext1234').toBeUndefined()
      expect(validator '1-234 567.89/01 ext.1234').toBeUndefined()
      expect(validator '1(234)5678901x1234').toBeUndefined()
      expect(validator '1 416 555 9292').toBeUndefined()
      expect(validator '1-234-567-8901').toBeUndefined()
      expect(validator '1-234-567-8901 x1234').toBeUndefined()
      expect(validator '1-234-567-8901 ext1234').toBeUndefined()
      expect(validator '1 (234) 567-8901').toBeUndefined()
      expect(validator '1.234.567.8901').toBeUndefined()
      expect(validator '1/234/567/8901').toBeUndefined()
      expect(validator '1-234-567-8901 ext. 1234').toBeUndefined()

    it 'out-of-country format from CH', () ->
      expect(validator '00 1 234-567-8901 ext. 123').toBeUndefined()
      expect(validator '00 61 2 9999 9999').toBeUndefined()

    it 'undefined format', () ->
      expect(validator '926 1234567').toBeUndefined()
      expect(validator '9261234567').toBeUndefined()
      expect(validator '9261234567x1').toBeUndefined()
      expect(validator '1234567').toBeUndefined()
      expect(validator '123-4567').toBeUndefined()
      expect(validator '123-89-01').toBeUndefined()
      expect(validator '495 1234567').toBeUndefined()
      expect(validator '469 123 45 67').toBeUndefined()
      expect(validator '89261234567').toBeUndefined()
      expect(validator '8 (926) 1234567').toBeUndefined()
      expect(validator '926.123.4567').toBeUndefined()
      expect(validator '415-555-1234').toBeUndefined()
      expect(validator '202 555 4567').toBeUndefined()
      expect(validator '(+351) 282 433 5050').toBeUndefined()
      expect(validator '(+351) 282 43 50 50').toBeUndefined()
      expect(validator '(0055)(123)8575973').toBeUndefined()

  describe 'should validate phone numbers from', () ->
    it 'Poland', () ->
      expect(validator '+48 605-767-800').toBeUndefined()
      expect(validator '+48 22 715-94-12').toBeUndefined()
      expect(validator '605 767 800').toBeUndefined()

    it 'UK', () ->
      expect(validator '+44 (0) 1234 567890').toBeUndefined()
      expect(validator '+441234567890').toBeUndefined()
      expect(validator '01234567890').toBeUndefined()

  it 'shouldn\'t validate incorrect phone numbers', () ->
    out = validator '8 800 600-APPLE'
    expect(out).toBeDefined()
    expect(out.type).toBeDefined()
    expect(out.message).toBeDefined()

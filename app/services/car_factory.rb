class CarFactory
  def self.create(data)
    manufacturer = create_manufacturer data[:manufacturer]
    model_range = create_model_range(data[:range].to_s, manufacturer)
    model = create_model(data[:model].to_s, model_range)
    bodytype = create_bodytype data[:bodystyle]

    create_derivative(model_id: model.id, bodytype_id: bodytype.id,
                      capcode: data[:capcode], name: data[:derivative],
                      transmission: transmission(data),
                      fueltype: fueltype(data), doors: data[:doors])
  end

  def self.fueltype(data)
    type = data[:fueltype]
    if type == 'P'
      :petrol
    elsif type == 'D'
      :diesel
    end
  end

  def self.transmission(data)
    transmission = data[:transmission]
    if transmission == 'M'
      :manual
    elsif transmission == 'A'
      :automatic
    end
  end

  def self.create_derivative(derivative)
    Derivative.find_or_initialize_by(capcode: derivative[:capcode])
              .update(derivative)
  end

  def self.create_manufacturer(name)
    Manufacturer.find_or_create_by(name: name.titleize)
  end

  def self.create_model_range(name, manufacturer)
    model_range = ModelRange.find_or_initialize_by(name: name.titleize)
    model_range.update(manufacturer: manufacturer)

    model_range
  end

  def self.create_model(name, model_range)
    new_name = name.gsub(model_range.name.capitalize, '')
                   .gsub('DIESEL', '')
                   .gsub(/SPECIAL EDITION\.?/, '')
    model = Model.find_or_initialize_by(name: new_name.titleize)
    model.update(model_range: model_range)

    model
  end

  def self.create_bodytype(name)
    Bodytype.find_or_create_by(name: name.titleize)
  end
end

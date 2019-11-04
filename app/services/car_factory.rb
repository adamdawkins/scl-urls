class CarFactory
  def self.create(data)
    manufacturer = create_manufacturer data[:manufacturer]
    model_range = create_model_range(data[:range].to_s, manufacturer)
    model = create_model(data[:model].to_s, model_range)
    bodytype = create_bodytype data[:bodystyle]

    create_derivative(model, bodytype, data)
  end

  def self.create_derivative(model, bodytype, data)
    Derivative.find_or_initialize_by(capcode: data[:capcode])
              .update(model: model, bodytype: bodytype, name: data[:derivative],
                      fueltype: data[:fueltype], doors: data[:doors],
                      transmission: data[:transmission])
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
    new_name = name.gsub('_', ' ')
                   .gsub('DIESEL', '').gsub(/SPECIAL EDITIONS?/, '')
                   .strip

    unless new_name == model_range.name.upcase
      new_name = new_name.gsub(model_range.name.upcase, '')
    end

    model = Model.find_or_initialize_by(name: new_name.strip.titleize,
                                        model_range_id: model_range.id)
    model.update(model_range: model_range)

    model
  end

  def self.create_bodytype(name)
    Bodytype.find_or_create_by(name: name.titleize)
  end
end

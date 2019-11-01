require_relative '../services/car_factory'
class ImportCapDataJob < ApplicationJob
  queue_as :default

  def perform
    cars = SmarterCSV.process('public/cap.csv')
    cars.each do |car|
      CarFactory.create(car)
    end
  end
end

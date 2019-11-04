require 'rails_helper'

describe 'Vehicle Requests', type: :request do
  describe 'GET /:id' do
    before do
      Channel.create(name: 'Car Leasing', slug: 'car-leasing')
      Channel.create(name: 'Van Leasing', slug: 'van-leasing')
    end
    context 'when the channel exists' do
      it 'should return successfully' do
        get '/car-leasing'
        expect(response).to have_http_status(200)
      end

      it 'should display the name of the channel' do
        get '/car-leasing'
        expect(response.body).to match %r{<h1>Car Leasing</h1>}

        get '/van-leasing'
        expect(response.body).to match %r{<h1>Van Leasing</h1>}
      end
    end
    context 'when the channel does not exist' do
      it 'should return a 404' do
        get '/boat-leasing'
        expect(response).to have_http_status(404)
      end
    end
  end

  #         GET /car-leasing/audi
  describe 'GET /:channel_id/:manufacturer' do
    context 'channel and manufacturer exist' do
      before do
        Channel.create(name: 'Car Leasing', slug: 'car-leasing')
        manufacturer = Manufacturer.create(name: 'Audi')
        manufacturer.model_ranges.create(name: 'A3')
        manufacturer.model_ranges.create(name: 'A4')
        manufacturer.model_ranges.create(name: 'A5')
      end

      it 'should return successfully' do
        get '/car-leasing/audi'
        expect(response).to have_http_status(200)
      end

      it 'should display the manufacturer name' do
        get '/car-leasing/audi'

        expect(response.body).to match %r{<h1>Audi</h1>}
      end

      it 'should display the model ranges for the Manufacturer' do
        get '/car-leasing/audi'

        expect(response.body).to match 'A3'
        expect(response.body).to match 'A4'
        expect(response.body).to match 'A5'
      end
    end
    context 'manufacturer does not exist' do
      before do
        Channel.create(name: 'Car Leasing', slug: 'car-leasing')
      end

      it 'returns a 404' do
        get('/car-leasing/saab')
        expect(response).to have_http_status(404)
      end
    end
  end
end

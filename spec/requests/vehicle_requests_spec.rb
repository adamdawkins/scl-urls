require 'rails_helper'
require 'support/shared_request_specs'

describe 'Vehicle Requests', type: :request do
  describe 'GET /:id' do
    let(:req) { get '/car-leasing' }
    before do
      Channel.create(name: 'Car Leasing', slug: 'car-leasing')
      Channel.create(name: 'Van Leasing', slug: 'van-leasing')
    end

    context 'when the channel exists' do
      it_behaves_like 'a successful response'

      it 'should display the name of the channel' do
        get '/car-leasing'
        expect(response.body).to match %r{<h1>Car Leasing</h1>}

        get '/van-leasing'
        expect(response.body).to match %r{<h1>Van Leasing</h1>}
      end
    end

    it_behaves_like 'a 404 without a channel'
  end

  #         GET /car-leasing/audi
  describe 'GET /:channel_id/:manufacturer' do
    let(:req) { get '/car-leasing/audi' }

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

    it_behaves_like 'a 404 without a manufacturer'
    it_behaves_like 'a 404 without a channel'
  end

  #         GET /car-leasing/audi/a3
  describe 'GET /:channel_id/:manufacturer_id/:id' do
    let(:req) { get '/car-leasing/audi/a3' }
    let!(:channel) { Channel.create(name: 'Car Leasing', slug: 'car-leasing') }
    let!(:manufacturer) { Manufacturer.create(name: 'Audi') }
    let!(:model_range) { manufacturer.model_ranges.create(name: 'A3') }

    it_behaves_like 'a successful response'

    it 'should display the manufacturer name and range name in an h1' do
      get '/car-leasing/audi/a3'
      expect(response.body).to match %r{<h1>Audi A3</h1>}
    end

    context 'the model range has many models' do
      before do
        model_range.models.create(name: 'A3 Hatchback')
        model_range.models.create(name: 'A3 Saloon')
        model_range.models.create(name: 'A3 Convertible')
      end

      it 'should display the models' do
        get '/car-leasing/audi/a3'

        expect(response.body).to match 'A3 Hatchback'
        expect(response.body).to match 'A3 Saloon'
        expect(response.body).to match 'A3 Convertible'
      end
    end

    context 'the model range has one model' do
      before do
        model_range.models.create(name: 'Hatchback')
      end

      it 'should redirect to the model' do
        get '/car-leasing/audi/a3'

        expect(response).to redirect_to '/car-leasing/audi/a3/hatchback'
      end
    end

    it_behaves_like 'a 404 without a model range'
    it_behaves_like 'a 404 without a manufacturer'
    it_behaves_like 'a 404 without a channel'
  end

  #         GET /car-leasing/nissan/qashqai/suv
  describe 'GET /:channel_id/:manufacturer_id/:model_range_id/:id' do
    let(:req) { get '/car-leasing/nissan/qashqai/suv' }
    let!(:channel) { Channel.create(name: 'Car Leasing', slug: 'car-leasing') }
    let!(:manufacturer) { Manufacturer.create(name: 'Nissan') }
    let!(:model_range) { manufacturer.model_ranges.create(name: 'Qashqai') }
    let!(:model) { model_range.models.create(name: 'SUV') }

    it_behaves_like 'a successful response'

    it_behaves_like 'a 404 without a model'
    it_behaves_like 'a 404 without a model range'
    it_behaves_like 'a 404 without a manufacturer'
    it_behaves_like 'a 404 without a channel'
  end

  #         GET /car-leasing/audi/a3/hatchback/30-tfsi-116-se-technik-5dr
  describe 'GET /:channel_id/:manufacturer_id/:model_range_id/:model_id/:derivative_id' do
    let(:req) { get '/car-leasing/audi/a3/hatchback/30-tfsi-116-se-technik-5dr' }
    let!(:channel) { Channel.create(name: 'Car Leasing', slug: 'car-leasing') }
    let!(:manufacturer) { Manufacturer.create(name: 'Audi') }
    let!(:model_range) { manufacturer.model_ranges.create(name: 'A3') }
    let!(:model) { model_range.models.create(name: 'Hatchback') }
    let!(:derivative) { model.derivatives.create(name: '30 TFSI 116 SE Technik 5dr', bodytype: Bodytype.create(name: 'Hatchback')) }

    it_behaves_like 'a successful response'

    context 'without a derivative' do
      before do
        Derivative.destroy_all
      end

      it 'returns a 404' do
        req
        expect(response).to have_http_status 404
      end
    end

    it_behaves_like 'a 404 without a model'
    it_behaves_like 'a 404 without a model range'
    it_behaves_like 'a 404 without a manufacturer'
    it_behaves_like 'a 404 without a channel'
  end
end

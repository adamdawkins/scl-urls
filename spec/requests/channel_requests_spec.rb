require 'rails_helper'

describe 'Channel Requests' do
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
      it 'should return 404' do
        get '/boat-leasing'
        expect(response).to have_http_status(404)
      end
    end
  end
end

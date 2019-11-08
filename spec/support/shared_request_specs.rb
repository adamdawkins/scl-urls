# These examples are used in specs with the syntax
# `it_behaves_like 'example name'`

RSpec.shared_examples 'a successful response' do
  it 'returns successfully' do
    req
    expect(response).to have_http_status 200
  end
end

RSpec.shared_examples 'a 404 without a channel' do
  context 'without a channel' do
    before do
      Channel.destroy_all
    end

    it 'returns a 404' do
      req
      expect(response).to have_http_status 404
    end
  end
end

RSpec.shared_examples 'a 404 without a manufacturer' do
  context 'without a manufacturer' do
    before do
      Manufacturer.destroy_all
    end

    it 'returns a 404' do
      req
      expect(response).to have_http_status 404
    end
  end
end

RSpec.shared_examples 'a 404 without a model range' do
  context 'without a model range' do
    before do
      ModelRange.destroy_all
    end

    it 'returns a 404' do
      req
      expect(response).to have_http_status 404
    end
  end
end

RSpec.shared_examples 'a 404 without a model' do
  context 'without a model' do
    before do
      Model.destroy_all
    end

    it 'returns a 404' do
      req
      expect(response).to have_http_status 404
    end
  end
end

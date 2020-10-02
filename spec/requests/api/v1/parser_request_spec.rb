# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Api::V1::Parsers', type: :request do
  describe 'GET /api/v1/parser' do
    before do
      VCR.use_cassette(url) do
        get "/api/v1/parser?url=#{url}"
      end
    end

    context 'when valid url' do
      let(:url) { 'https://unsplash.com/' }

      it 'returns images urls' do
        expect(json['attributes']['urls']).not_to be_empty
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(:ok)
      end
    end

    context 'when invalid url' do
      let(:url) { 'invalid url' }

      it 'returns errors' do
        expect(json['errors']).not_to be_empty
        expect(json['errors'].first['detail']).to eq('Invalid url')
      end

      it 'returns status code 422' do
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end

    context 'when url without images' do
      let(:url) { 'http://example.com/' }

      it 'returns images urls' do
        expect(json['attributes']['urls']).to be_empty
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(:ok)
      end
    end
  end
end

# frozen_string_literal: true

require 'rails_helper'

describe Parser::ValidateUrl do
  describe '#call' do
    subject(:interactor) { described_class.call(url: url) }

    context 'with valid url' do
      %w[https://example.com/
         https://unsplash.com/].each do |valid_url|
        let(:url) { valid_url }

        it 'passes successfully' do
          expect(interactor).to be_a_success
        end
      end
    end

    context 'with invalid url' do
      %w[https://
         some_invalid_url
         test
         foo
         example.com].each do |invalid_url|
        let(:url) { invalid_url }

        it 'fails' do
          expect(interactor).to be_a_failure
        end

        it 'returns error' do
          expect(interactor.message).to eq('Invalid url')
        end
      end
    end
  end
end

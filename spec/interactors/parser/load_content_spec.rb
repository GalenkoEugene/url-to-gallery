# frozen_string_literal: true

require 'rails_helper'

describe Parser::LoadContent do
  describe '#call' do
    subject(:interactor) { described_class.call(url: url) }

    let(:url) { 'https://unsplash.com/' }

    context 'when successful loading' do
      before do
        VCR.use_cassette(url) { interactor.call }
      end

      it 'setup document' do
        expect(interactor.document).to be_an_instance_of(Nokogiri::HTML::Document)
      end

      it 'passes successfully' do
        expect(interactor).to be_a_success
      end
    end

    context 'when unsuccessful loading' do
      before { allow(URI).to receive(:open).with(url).and_raise(StandardError) }

      it 'fails' do
        expect(interactor).to be_a_failure
      end

      it 'does not setup document' do
        expect(interactor.document).to be_nil
      end
    end
  end
end

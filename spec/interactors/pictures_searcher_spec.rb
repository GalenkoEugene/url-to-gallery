# frozen_string_literal: true

require 'rails_helper'

describe PicturesSearcher do
  describe '#call' do
    it 'call chain of interacorts' do
      expect(described_class.organized).to eq([
                                                Parser::ValidateUrl,
                                                Parser::LoadContent,
                                                Parser::FetchUries,
                                                Parser::TrimParams,
                                                Parser::AppendUrlToRelativeSrcs
                                              ])
    end
  end
end

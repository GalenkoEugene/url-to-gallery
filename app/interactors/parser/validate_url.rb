# frozen_string_literal: true

module Parser
  class ValidateUrl
    include Interactor
    URL_EXAC_MATCHER = /\A#{URI::DEFAULT_PARSER.make_regexp}\z/.freeze

    def call
      context.fail!(message: 'Invalid url') unless valid_url?
    end

    private

    def valid_url?
      context.url =~ URL_EXAC_MATCHER
    end
  end
end

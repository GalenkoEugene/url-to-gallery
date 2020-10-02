# frozen_string_literal: true

require 'open-uri'

module Parser
  class LoadContent
    include Interactor

    def call
      context.document = Nokogiri::HTML.parse(URI.open(context.url))
    rescue StandardError
      context.fail!(message: "Something wrong with #{context.url} resource might be unavailable!")
    end
  end
end

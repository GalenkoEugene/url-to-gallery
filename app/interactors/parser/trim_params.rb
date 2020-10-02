# frozen_string_literal: true

module Parser
  class TrimParams
    include Interactor
    URI_PARAMS_DELIMITER = '?'

    def call
      context.images_urls = bare_images_urls
    rescue StandardError
      context.fail!(message: 'An error occurred during image processing!')
    end

    private

    def bare_images_urls
      context.images_uries.map do |uri|
        uri.split(URI_PARAMS_DELIMITER).first
      end
    end
  end
end

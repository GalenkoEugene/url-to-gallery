# frozen_string_literal: true

module Parser
  class AppendUrlToRelativeSrcs
    include Interactor
    URI_PARAMS_DELIMITER = '?'

    def call
      context.images_urls.map! do |url|
        url.start_with?('/') ? "#{context.url}#{url}" : url
      end
    end
  end
end

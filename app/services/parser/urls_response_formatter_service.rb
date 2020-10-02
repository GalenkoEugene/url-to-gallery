# frozen_string_literal: true

module Parser
  class UrlsResponseFormatterService
    def initialize(url:)
      @result = PicturesSearcher.call(url: url)
    end

    def call
      return { json: success_response, status: :ok } if result.success?

      { json: failure_response, status: :unprocessable_entity }
    end

    private

    attr_reader :result

    def failure_response
      {
        data: {
          errors: [
            {
              detail: result.message
            }
          ]
        }
      }
    end

    def success_response
      {
        data: {
          type: 'images_ulrs',
          attributes: {
            urls: result.images_urls
          }
        }
      }
    end
  end
end

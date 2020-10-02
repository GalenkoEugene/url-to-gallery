# frozen_string_literal: true

module Parser
  class FetchUries
    include Interactor

    def call
      context.images_uries = fetch_images_uries
    end

    private

    def fetch_images_uries
      context.document.xpath('//img').pluck(:src)
    end
  end
end

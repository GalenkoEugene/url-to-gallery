# frozen_string_literal: true

module Api
  module V1
    class ParserController < ApplicationController
      # GET /api/v1/parser?url='url'
      def index
        render Parser::UrlsResponseFormatterService.new(url: params[:url]).call
      end
    end
  end
end

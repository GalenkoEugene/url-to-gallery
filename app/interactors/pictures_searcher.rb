# frozen_string_literal: true

class PicturesSearcher
  include Interactor::Organizer

  organize Parser::ValidateUrl,
           Parser::LoadContent,
           Parser::FetchUries,
           Parser::TrimParams,
           Parser::AppendUrlToRelativeSrcs
end

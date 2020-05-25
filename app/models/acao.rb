class Acao < ApplicationRecord
  validates_presence_of :descricao_acao
  include PgSearch

  pg_search_scope :search_by_descricao_acao, against: [:descricao_acao], using: {
      tsearch: {
          prefix: true
      }
  }
end

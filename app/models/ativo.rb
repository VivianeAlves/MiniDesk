class Ativo < ApplicationRecord
  validates_presence_of :descricao_ativo

  include PgSearch
  pg_search_scope :search_by_descricao_ativo, against: [:descricao_ativo], using: {
      tsearch: {
          prefix: true
      }
  }
end

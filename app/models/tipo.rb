class Tipo < ApplicationRecord
  validates_presence_of :descricao_tipo
  include PgSearch
  pg_search_scope :search_by_descricao_tipo, against: [:descricao_tipo], using: {
      tsearch: {
          prefix: true
      }
  }
end

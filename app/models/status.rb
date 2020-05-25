class Status < ApplicationRecord
  validates_presence_of :descricao_status
  include PgSearch
  pg_search_scope :search_by_descricao_status, against: [:descricao_status], using: {
      tsearch: {
          prefix: true
      }
  }
end

class Setor < ApplicationRecord
  validates_presence_of :nome
  has_many :usuarios

  include PgSearch
  pg_search_scope :search_by_nome_setor, against: [:nome], using: {
      tsearch: {
          prefix: true
      }
  }
end

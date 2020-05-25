class Tecnico < ApplicationRecord
  belongs_to :usuario
  validates_presence_of :usuario
  include PgSearch

end

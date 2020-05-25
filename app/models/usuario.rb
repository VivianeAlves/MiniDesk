class Usuario < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :chamados
  has_one :tecnico
  belongs_to :setor
  validates_presence_of :nome, :sobrenome, :celular, :email

  include PgSearch
  pg_search_scope :search_by_nome, against: [:nome], using: {
      tsearch: {
          prefix: true
      }
  }

  def is_tecnico?
    !self.tecnico.nil?
  end

  def is_admin?
    if !self.tecnico.nil?
      self.tecnico.admin
    end
  end

  def self.current
    Thread.current[:usuario]
  end

  def self.current=(usuario)
    Thread.current[:usuario] = usuario
  end

end

class Author < ActiveRecord::Base
  has_many :books

  validates :name, presence: true, length: { minimum: 3 }, uniqueness: true
end

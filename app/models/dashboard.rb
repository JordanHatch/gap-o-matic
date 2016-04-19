class Dashboard < ActiveRecord::Base
  has_many :entries
  belongs_to :creator, class_name: 'User'

  validates :title, presence: true
end

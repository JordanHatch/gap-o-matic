class Dashboard < ActiveRecord::Base
  has_many :entries
  belongs_to :creator, class_name: 'User'

  scope :in_title_order, -> { order(title: :asc) }

  validates :title, presence: true
end

class Entry < ActiveRecord::Base
  belongs_to :dashboard

  validates :title, :percent, presence: true
  validates :percent, numericality: {
                        only_integer: true,
                        greater_than_or_equal_to: 0,
                        less_than_or_equal_to: 100,
                      }
  validates :order, numericality: {
                      only_integer: true,
                      greater_than_or_equal_to: 0,
                    }

  default_scope -> { where(deleted: false).order(order: :asc) }

  def soft_delete!
    update_attribute(:deleted, true)
  end
end

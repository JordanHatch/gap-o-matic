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

  after_save :update_timestamp_of_dashboard

  def soft_delete!
    update_attribute(:deleted, true)
  end

private
  def update_timestamp_of_dashboard
    dashboard.touch
  end
end

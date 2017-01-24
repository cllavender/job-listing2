class Job < ApplicationRecord
  validates :title, presence: true
  validates :wage_upper_bound, presence: true
  validates :wage_lower_bound, presence: true
  validates :wage_lower_bound, numericality: { greater_than: 0}
  validates :city, presence: true
  validates :location, presence: true
  validates :field, presence: true
  validates :require_time, presence: true

  scope :published, -> { where(is_hidden: false) }
  scope :recent, -> { order('created_at DESC') }

  has_many :resumes

  def job_publish!
    self.is_hidden = false
    self.save
  end

  def job_hide!
    self.is_hidden = true
    self.save
  end

end

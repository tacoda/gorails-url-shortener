class Link < ApplicationRecord
  validates :url, presence: true

  scope :recent_first, -> { order(created_at: :desc) }

  def self.find(id)
    super(ShortCode.decode(id))
  end

  def to_param
    ShortCode.encode(id)
  end
end

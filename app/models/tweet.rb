class Tweet < ActiveRecord::Base
  validates :content,
    presence: true,
    length: { maximum: 255 }
  default_scope -> { order('created_at DESC') }
end

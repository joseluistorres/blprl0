class Minute < ActiveRecord::Base
  validates :content, :presence => true, :allow_blank => false
  belongs_to :user
  has_many :tasks
end

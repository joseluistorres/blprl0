class Task < ActiveRecord::Base
  belongs_to :minute
  belongs_to :user
end

class Task < ApplicationRecord
  belongs_to :event

  validates_presence_of :name
end

class Video < ActiveRecord::Base
  has_many :snapshots
end

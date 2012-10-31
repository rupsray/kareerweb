class Academic < ActiveRecord::Base
  attr_accessible :institute, :percentage, :qualification, :user_id, :year_of_passout
end

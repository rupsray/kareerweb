class Skill < ActiveRecord::Base
  attr_accessible :skill_name, :user_id

  belongs_to	:user
end

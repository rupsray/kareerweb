class Resume < ActiveRecord::Base
  attr_accessible :date_of_birth, :email_id, :name, :phone_number, :summary
end

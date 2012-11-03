class Resume < ActiveRecord::Base
  attr_accessible :date_of_birth, :email_id, :name, :phone_number, :summary
  validates :phone_number, :length => {:is => 10}, :numericality => { :only_integer => true }
  belongs_to	:user
end

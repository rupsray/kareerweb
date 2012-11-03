class ChangePhoneNumberType < ActiveRecord::Migration
  def up
    change_column :resumes, :phone_number, :string
  end

  def down
  end
end

class CreateResumes < ActiveRecord::Migration
  def change
    create_table :resumes do |t|
      t.string :name, :null => false, :default => ""
      t.text :summary
      t.integer :phone_number, :null => false, :default => ""
      t.string :email_id, :null => false, :default => ""
      t.string :date_of_birth, :null => false, :default => ""
      t.float  :experience, :null => false, :default => 0
      t.integer :user_id, :null => false

      t.timestamps
    end

    add_index :resumes, :name,       :unique => true
    add_index :resumes, :user_id,    :unique => true
    add_index :resumes, :experience, :unique => true
  end
end

class CreateSkills < ActiveRecord::Migration
  def change
    create_table :skills do |t|
      t.string :skill_name, :null => false, :default => ""
      t.integer :user_id, :null => false

      t.timestamps
    end

    add_index :skills, :skill_name, :unique => true
    add_index :skills, :user_id,    :unique => true
  end
end

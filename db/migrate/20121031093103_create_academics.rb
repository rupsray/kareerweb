class CreateAcademics < ActiveRecord::Migration
  def change
    create_table :academics do |t|
      t.string :qualification, :null => false, :default => ""
      t.string :institute, :null => false, :default => ""
      t.float :percentage, :null => false, :default => ""
      t.integer :year_of_passout, :null => false, :default => ""
      t.integer :user_id, :null => false

      t.timestamps
    end

    add_index :academics, :qualification,    :unique => true
    add_index :academics, :institute,    :unique => true
    add_index :academics, :percentage,    :unique => true
    add_index :academics, :year_of_passout,    :unique => true
    add_index :academics, :user_id,    :unique => true
  end
end

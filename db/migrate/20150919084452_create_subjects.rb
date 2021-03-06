class CreateSubjects < ActiveRecord::Migration
  def up
    create_table :subjects do |t|
      t.column "name", :string
      t.integer "position"
      t.boolean "visible", :default => false
      t.timestamps
    end
  end

  def down
  	drop_table :subjects
  end

end

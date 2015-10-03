class CreateNotePads < ActiveRecord::Migration
  def up
    create_table :note_pads do |t|
    	#t.integer "note_padID"
    	t.string "title", :default => "untitled"
    	t.text "content"
      	t.timestamps
    end
  end

  def down
  	drop_table :note_pads
  end

end

class AddObjectChangesIfNotThere < ActiveRecord::Migration
  def change
    if PaperTrail::Version and !PaperTrail::Version.columns.map(&:name).include?('object_changes')
      add_column :versions, :object_changes, :text
    else
      puts "SMART! You already have it!! "*100
    end
  end
end

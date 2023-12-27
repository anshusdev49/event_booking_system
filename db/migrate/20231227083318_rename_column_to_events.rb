class RenameColumnToEvents < ActiveRecord::Migration[6.1]
  def change
    remove_reference :events, :event_organizer, index: true, foreign_key: true
    add_reference :events, :user, index: true, foreign_key: true
  end
end

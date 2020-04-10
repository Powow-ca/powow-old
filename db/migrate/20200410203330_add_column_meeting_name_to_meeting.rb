class AddColumnMeetingNameToMeeting < ActiveRecord::Migration[6.0]
  def change
    add_column :meetings, :room, :string
    add_column :meetings, :password, :string
  end
end

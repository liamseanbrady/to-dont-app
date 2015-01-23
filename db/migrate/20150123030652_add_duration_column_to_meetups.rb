class AddDurationColumnToMeetups < ActiveRecord::Migration
  def change
    add_column :meetups, :duration, :integer, default: 1
  end
end

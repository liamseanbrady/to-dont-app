class CreateMeetups < ActiveRecord::Migration
  def change
    create_table :meetups do |t|
      t.column :title, :string
      t.column :location, :string
      t.column :event_date, :datetime
      t.column :organizer_id, :integer
      
      t.timestamps
    end
  end
end

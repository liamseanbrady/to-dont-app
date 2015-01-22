class CreateSuccessDays < ActiveRecord::Migration
  def change
    create_table :success_days do |t|
      t.column :todont_id, :integer

      t.timestamps
    end
  end
end

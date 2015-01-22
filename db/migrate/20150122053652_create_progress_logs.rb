class CreateProgressLogs < ActiveRecord::Migration
  def change
    create_table :progress_logs do |t|
      t.column :message, :text
      t.column :mood, :string
      t.column :todont_id, :integer

      t.timestamps
    end
  end
end

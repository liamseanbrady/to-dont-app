class CreateSupportGroup < ActiveRecord::Migration
  def change
    create_table :support_groups do |t|
      t.column :moderator, :integer
      t.column :name, :string

      t.timestamps
    end
  end
end

class CreateMemberships < ActiveRecord::Migration
  def change
    create_table :memberships do |t|
      t.column :user_id, :integer
      t.column :joinable_type, :string
      t.column :joinable_id, :integer

      t.timestamps
    end
  end
end

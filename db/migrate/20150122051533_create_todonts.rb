class CreateTodonts < ActiveRecord::Migration
  def change
    create_table :todonts do |t|
      t.column :body, :string
      t.column :visibility, :string, default: 'private'
      t.column :user_id, :integer

      t.timestamps
    end
  end
end

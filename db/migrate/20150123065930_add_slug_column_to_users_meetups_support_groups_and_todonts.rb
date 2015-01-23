class AddSlugColumnToUsersMeetupsSupportGroupsAndTodonts < ActiveRecord::Migration
  def change
    add_column :users, :slug, :string
    add_column :meetups, :slug, :string
    add_column :support_groups, :slug, :string
    add_column :todonts, :slug, :string
  end
end

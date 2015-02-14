class ChangeColumnNameToModeratorIdInSupportGroups < ActiveRecord::Migration
  def change
    rename_column :support_groups, :moderator, :moderator_id
  end
end

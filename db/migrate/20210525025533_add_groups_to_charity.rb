class AddGroupsToCharity < ActiveRecord::Migration[5.2]
  def change
    add_reference :charities, :group, foreign_key: true
  end
end

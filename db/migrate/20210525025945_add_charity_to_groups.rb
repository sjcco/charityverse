class AddCharityToGroups < ActiveRecord::Migration[5.2]
  def change
    add_reference :groups, :charity, foreign_key: true
  end
end

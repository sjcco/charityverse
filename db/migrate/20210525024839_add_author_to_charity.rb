class AddAuthorToCharity < ActiveRecord::Migration[5.2]
  def change
    add_reference :charities, :author, foreign_key: { to_table: :users }
  end
end

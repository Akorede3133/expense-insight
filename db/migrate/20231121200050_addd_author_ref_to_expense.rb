class AdddAuthorRefToExpense < ActiveRecord::Migration[7.1]
  def change
    add_column :expenses, :author_id, :integer
    add_foreign_key :expenses, :users, column: 'author_id'
    add_index :expenses, :author_id
  end
end

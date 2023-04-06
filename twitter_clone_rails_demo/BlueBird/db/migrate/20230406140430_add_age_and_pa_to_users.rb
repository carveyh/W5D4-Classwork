class AddAgeAndPaToUsers < ActiveRecord::Migration[7.0]
  def change
    #add_column method inherited from ActiveRecord::Migration
    add_column :users, :political_affiliation, :string, null: false #table, col_name, type, hash of constraints
    add_column :users, :age, :integer, null: false
    add_index :users, :political_affiliation #will not constrain to unique since PA or age usu has duplicates
  end
end

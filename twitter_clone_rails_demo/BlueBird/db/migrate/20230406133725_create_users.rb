class CreateUsers < ActiveRecord::Migration[7.0]
  def change #method from ActiveRecord::Migration, will be run when a migration is RUN.
    create_table :users do |t| #creates a "users" table, with block param t representing created table
      t.string :username, null: false  #creates a string data type col named username, constraint cannot be null
      # t.string(:username, {null: false}) #This can also work, and closer to pure Ruby code. But we prefer above format for syntactic sugar
      t.string :email, null: false #these database level constraints preserve data integrity.
      
      t.timestamps
    end

    #index operation is O(logn) - via self balancing binary search tree similar to bsearch vs O(n) linear search.
        #accomplish with attach index to user
    add_index :users, :username, unique: true #specify the table, the col, and the database constraint - this is NOT same as primary key id
      #adding unique: true in add_index or t.string :username, null:false - where to put? putting in add_index will ensure O(logn) speed,
      #adding to the col creation will be O(n) speed
      #this constraint on the add_index will also become a constraint on the DB where you can't create duplicate usernames in general
    add_index :users, :email, unique: true
  end
end

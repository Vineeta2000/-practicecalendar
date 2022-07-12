class AddInfoToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :enrollment, :string
    add_column :users, :course, :string
    add_column :users, :branch, :string
    add_column :users, :year, :integer
   
  end
end

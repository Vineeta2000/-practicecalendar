class AddCollegeinfoToCollege < ActiveRecord::Migration[5.2]
  def change
    add_column :colleges, :collegename, :string
    add_column :colleges, :collegecode, :integer
  end
end

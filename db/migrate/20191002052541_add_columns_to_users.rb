class AddColumnsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :trainer, :boolean, default: false
    add_column :users, :trainee, :boolean, default: false
  end
end

class AddInfomationToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :name, :string
    add_column :users, :history,:integer
    add_column :users, :area, :string
    add_column :users, :gym, :string, default:"自宅"
    add_column :users, :goal, :string
    add_column :users, :image, :text
  end
end

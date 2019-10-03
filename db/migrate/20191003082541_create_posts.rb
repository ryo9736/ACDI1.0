class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :start_reason
      t.text :purpose
      t.text :current_status
      t.text :target
      t.string :like_points
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end

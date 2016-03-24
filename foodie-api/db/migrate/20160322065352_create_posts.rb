class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title, :null => false
      t.string :content
      t.boolean :visible, :default => false
      t.references :user, :index => true, :null => false
      t.string :type

      t.timestamps null: false
    end
  end
end

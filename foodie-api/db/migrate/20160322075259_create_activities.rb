class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.integer :action, :null => false
      t.references :trackable, :polymorphic => true, :null => false
      t.references :user, :null => false, :index => true

      t.timestamps null: false
    end
    add_index :activities, [:action, :trackable_id, :trackable_type]
  end
end

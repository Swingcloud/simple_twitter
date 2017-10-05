class CreateTweets < ActiveRecord::Migration[5.1]
  def change
    create_table :tweets do |t|
      t.text :description, null: false, default: ''
      t.integer :user_id, null: false
      t.timestamps
    end
    add_index :tweets, [:id, :user_id], unique: true
  end
end

class CreateMicromessages < ActiveRecord::Migration
  def change
    create_table :micromessages do |t|
      t.string :content
      t.integer :user_id

      t.timestamps
    end
    add_index :micromessages, [:user_id, :created_at]
  end
end

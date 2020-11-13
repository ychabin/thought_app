class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.text :comment,   null: false
      t.references :user
      t.references :thought
      t.timestamps
    end
  end
end

class AddPolymorphicToLikes < ActiveRecord::Migration[7.1]
  def change
    remove_index :likes, column: :post_id
    remove_column :likes, :post_id, :integer
    add_reference :likes, :likable, polymorphic: true, null: false
  end
end

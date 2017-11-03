class CreateUserDetails < ActiveRecord::Migration[5.0]
  def change
    create_table :user_details do |t|
      t.integer :category_id
      t.integer :book_id
      t.date :return_date

      t.timestamps
    end
  end
end

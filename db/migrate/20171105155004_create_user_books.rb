class CreateUserBooks < ActiveRecord::Migration[5.0]
  def change
    create_table :user_books do |t|
      t.references :user, foreign_key: true
      t.references :book, foreign_key: true
      t.date :return_date
      t.string :shipping_address

      t.timestamps
    end
  end
end

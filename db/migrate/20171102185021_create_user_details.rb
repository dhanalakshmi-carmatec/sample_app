class CreateUserDetails < ActiveRecord::Migration[5.0]
  def change
    create_table :user_details do |t|
      t.references :user
      t.string :category
      t.references :book
      t.date :return_date

      t.timestamps
    end
  end
end

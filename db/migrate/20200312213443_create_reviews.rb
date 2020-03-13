class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.string :name
      t.string :title
      t.integer :hotel_id
      t.integer :rating
      t.text :opinion

      t.timestamps
    end
  end
end

class AddPrefectureIdToHotel < ActiveRecord::Migration[5.2]
  def change
    add_column :hotels, :prefecture_id, :integer
  end
end

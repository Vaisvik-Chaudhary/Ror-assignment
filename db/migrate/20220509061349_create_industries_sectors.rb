class CreateIndustriesSectors < ActiveRecord::Migration[7.0]
  def change
    create_table :industries_sectors ,id:false do |t|
      t.references :industry
      t.references :sector
      t.timestamps
    end
  end
end

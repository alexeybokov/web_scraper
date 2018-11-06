class CreateIlearnDistrict < ActiveRecord::Migration[5.2]
  def change
    create_table :ilearn_districts do |t|
      t.integer :district_number
      t.string :district_name
      t.string :superintendent
      t.string :address
      t.string :phone
      t.string :district_type
      t.string :data_source_url
      t.string :scrape_dev

      t.timestamps
    end
    change_column :ilerrn_districts, :district_number, :bigint
  end
end

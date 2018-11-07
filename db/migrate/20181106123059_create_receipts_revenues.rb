class CreateReceiptsRevenues < ActiveRecord::Migration[5.2]
  def change
    create_table :receipts_revenues do |t|
      t.string :district_number
      t.string :district_name
      t.bigint :state_amount
      t.bigint :local_amount
      t.bigint :federal_amount
      t.bigint :total_amount
      t.string :data_source_url
      t.string :scrape_dev

      t.references :ilearn_districts, foreign_key: true
    end
  end
end

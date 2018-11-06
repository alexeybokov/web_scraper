class CreateIlearnExpendituresDisbursements < ActiveRecord::Migration[5.2]
  def change
    create_table :ilearn_expenditures_disbursements do |t|
      t.bigint :district_number
      t.string :district_name
      t.integer :instruction_amount
      t.integer :general_administration_amount
      t.integer :suppert_services_amount
      t.integer :other_amount
      t.integer :total_amount
      t.string :data_source_url
      t.string :scrape_dev

      t.references :ilearn_districts, foreign_key: true
    end
  end
end

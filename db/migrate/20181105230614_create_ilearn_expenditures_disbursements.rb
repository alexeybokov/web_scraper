class CreateIlearnExpendituresDisbursements < ActiveRecord::Migration[5.2]
  def change
    create_table :ilearn_expenditures_disbursements do |t|
      t.string :district_number
      t.string :district_name
      t.bigint :instruction_amount
      t.bigint :general_administration_amount
      t.bigint :suppert_services_amount
      t.bigint :other_amount
      t.bigint :total_amount
      t.string :data_source_url
      t.string :scrape_dev

      t.references :ilearn_districts, foreign_key: true
    end
  end
end

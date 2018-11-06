class IlearnTaxInformation < ActiveRecord::Migration[5.2]
  def change
    create_table :ilearn_tax_information do |t|
      t.integer :district_number
      t.string :district_name
      t.integer :real_eav
      t.integer :real_per_pupil
      t.integer :statewide_eavpp_rank
      t.string :formula_type
      t.integer :total_tax_rate
      t.integer :statewide_ttr_rank
      t.integer :operating_tax_rate
      t.integer :statewide_otr_rank

      t.timestamps
    end
    change_column :ilerrn_tax_information, :district_number, :bigint
  end
end

class IlearnTaxInformation < ActiveRecord::Migration[5.2]
  def change
    create_table :ilearn_tax_information do |t|
      t.string :district_number
      t.string :district_name
      t.bigint :real_eav
      t.bigint :real_per_pupil
      t.integer :statewide_eavpp_rank
      t.string :formula_type
      t.float :total_tax_rate
      t.integer :statewide_ttr_rank
      t.float :operating_tax_rate
      t.bigint :statewide_otr_rank
    end
  end
end

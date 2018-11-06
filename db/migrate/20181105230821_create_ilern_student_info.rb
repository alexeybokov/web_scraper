class CreateIlernStudentInfo < ActiveRecord::Migration[5.2]
  def change
    create_table :ilern_student_info do |t|
      t.integer :district_number
      t.string :district_name
      t.integer '9-Month Avg. Daily Attendance'
      t.integer 'Statewide ADA'
      t.integer 'Net Operating Expanse'
      t.integer 'Operating Expance Per Pupil (OEPP)'
      t.integer 'Statewide OEPP Rank'
      t.integer 'Statewide OEPP'
      t.integer 'Allowance for Tuition Computation'
      t.integer 'Per Capita Tuition Charge (PCTC)'
      t.integer 'Statewide PCTC Rank'
      t.integer 'Statewide PCTC'
      t.string :data_source_url
      t.string :scrape_dev

      t.timestamps
      t.references :ilearn_districts, foreign_key: true
    end
    change_column :ilerrn_student_info, :district_number, :bigint
  end
end

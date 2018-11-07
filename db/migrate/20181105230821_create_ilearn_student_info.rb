class CreateIlearnStudentInfo < ActiveRecord::Migration[5.2]
  def change
    create_table :ilearn_student_info do |t|
      t.string :district_number
      t.string :district_name
      t.integer '9-Month Avg. Daily Attendance'
      t.bigint 'Statewide ADA'
      t.bigint 'Net Operating Expanse'
      t.bigint 'Operating Expance Per Pupil (OEPP)'
      t.bigint 'Statewide OEPP Rank'
      t.bigint 'Statewide OEPP'
      t.bigint 'Allowance for Tuition Computation'
      t.bigint 'Per Capita Tuition Charge (PCTC)'
      t.integer 'Statewide PCTC Rank'
      t.integer 'Statewide PCTC'
      t.string :data_source_url
      t.string :scrape_dev

      t.references :ilearn_districts, foreign_key: true
    end
  end
end

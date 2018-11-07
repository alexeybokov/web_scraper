class CreateIlearnStudentInfo < ActiveRecord::Migration[5.2]
  def change
    create_table :ilearn_student_info do |t|
      t.string :district_number
      t.string :district_name
      t.float  :eigth_month_avg_daily_Attendance
      t.float  :statewide_ADA
      t.bigint :net_perating_xpanse
      t.bigint :operating_expance_per_pupil_OEPP
      t.bigint :statewide_OEPP_rank
      t.bigint :statewide_OEPP
      t.bigint :allowance_for_tuition_computation
      t.bigint :per_capita_tuition_charge_PCTC
      t.integer :statewide_PCTC_rank
      t.integer :statewide_PCTC
      t.string :data_source_url
      t.string :scrape_dev

      t.references :ilearn_districts, foreign_key: true
    end
  end
end

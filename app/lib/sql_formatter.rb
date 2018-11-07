class SqlFormatter
  def self.query_for_ilearn_districts(parser)
    %{
      INSERT INTO ilearn_districts
        (
          district_number,
          district_name,
          superintendent,
          address,
          phone,
          district_type,
          data_source_url,
          scrape_dev
        )

      VALUES
        (
          '#{parser.number}',
          '#{parser.name}',
          '#{parser.superintendent}',
          '#{parser.address}',
          '#{parser.phone}',
          '#{parser.district_type}',
          '#{parser.data_source_url}',
          '#{parser.scrape_dev}'
        );
    }
  end

  def self.query_for_ilearn_district_id(parser)
    %{SELECT id FROM ilearn_districts WHERE district_number = '#{parser.number}'}
  end

  def self.query_for_receipts_revenues(parser, ilearn_districts_id)
    %{
      INSERT INTO receipts_revenues
        (
          district_number,
          district_name,
          state_amount,
          local_amount,
          federal_amount,
          total_amount,
          data_source_url,
          scrape_dev,
          ilearn_districts_id
        )

      VALUES
        (
          '#{parser.number}',
          '#{parser.name}',
          #{parser.state_amount},
          #{parser.local_amount},
          #{parser.federal_amount},
          #{parser.total_amount},
          '#{parser.data_source_url}',
          '#{parser.scrape_dev}',
          #{ilearn_districts_id}
        );
    }
  end

  def self.query_for_ilearn_student_info(parser, ilearn_districts_id)
    %{
      INSERT INTO ilearn_student_info
        (
          district_number,
          district_name,
          "9-Month Avg. Daily Attendance",
          "Statewide ADA",
          "Net Operating Expanse",
          "Operating Expance Per Pupil (OEPP)",
          "Statewide OEPP Rank",
          "Statewide OEPP",
          "Allowance for Tuition Computation",
          "Per Capita Tuition Charge (PCTC)",
          "Statewide PCTC Rank",
          "Statewide PCTC",
          data_source_url,
          scrape_dev,
          ilearn_districts_id
        )

      VALUES
        (
          '#{parser.number}',
          '#{parser.name}',
          #{parser.daily_attendance_evg},
          #{parser.statewide_ada},
          #{parser.net_operating},
          #{parser.operating_expance},
          #{parser.statewide_oepp_rank},
          #{parser.statewide_oepp},
          #{parser.allowance_for_tuition},
          #{parser.per_capita_tuition_charge},
          #{parser.statewide_pctc_rank},
          #{parser.statewide_pctc},
          '#{parser.data_source_url}',
          '#{parser.scrape_dev}',
          #{ilearn_districts_id}
        );
    }
  end

  def self.query_for_ilearn_tax_information(parser)
    %{
      INSERT INTO ilearn_tax_information
        (
         district_number,
         district_name,
         real_eav,
         real_per_pupil,
         statewide_eavpp_rank,
         formula_type,
         total_tax_rate,
         statewide_ttr_rank,
         operating_tax_rate,
         statewide_otr_rank
        )

      VALUES
        (
           '#{parser.number}',
           '#{parser.name}',
           #{parser.real_eav},
           #{parser.real_per_pupil},
           #{parser.statewide_eavpp_rank},
           '#{parser.formula_type}',
           #{parser.total_tax_rate},
           #{parser.statewide_ttr_rank},
           #{parser.operating_tax_rate},
           #{parser.statewide_otr_rank}
        );
    }
  end

  def self.query_for_ilearn_expenditures_disbursements(parser, ilearn_districts_id)
    %{
      INSERT INTO ilearn_expenditures_disbursements
        (
          district_number,
          district_name,
          instruction_amount,
          general_administration_amount,
          suppert_services_amount,
          other_amount,
          total_amount,
          data_source_url,
          scrape_dev,
          ilearn_districts_id
        )

      VALUES
        (
          '#{parser.number}',
          '#{parser.name}',
          #{parser.instruction_amount},
          #{parser.general_administration_amount},
          #{parser.support_services_amount},
          #{parser.other_amount},
          #{parser.total_amount_exp},
          '#{parser.data_source_url}',
          '#{parser.scrape_dev}',
          #{ilearn_districts_id}
        );
    }
  end
end

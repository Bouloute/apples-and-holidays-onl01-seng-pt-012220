require 'pry'

def second_supply_for_fourth_of_july(holiday_hash)
  # given that holiday_hash looks like this:
  # {
  #   :winter => {
  #     :christmas => ["Lights", "Wreath"],
  #     :new_years => ["Party Hats"]
  #   },
  #   :summer => {
  #     :fourth_of_july => ["Fireworks", "BBQ"]
  #   },
  #   :fall => {
  #     :thanksgiving => ["Turkey"]
  #   },
  #   :spring => {
  #     :memorial_day => ["BBQ"]
  #   }
  # }
  # return the second element in the 4th of July array
  holiday_hash[:summer][:fourth_of_july][1]
end

def add_supply_to_winter_holidays(holiday_hash, supply)
  # holiday_hash is identical to the one above
  # add the second argument, which is a supply, to BOTH the
  # Christmas AND the New Year's arrays
  holiday_hash[:winter].each{|holiday, stuff|
    stuff.push(supply)
  }

end


def add_supply_to_memorial_day(holiday_hash, supply)
  # again, holiday_hash is the same as the ones above
  # add the second argument to the memorial day array
  holiday_hash[:spring][:memorial_day].push(supply)
end

def add_new_holiday_with_supplies(holiday_hash, season, holiday_name, supply_array)
  # code here
  # remember to return the updated hash
  holiday_hash[season][holiday_name] = supply_array
end

def all_winter_holiday_supplies(holiday_hash)
  # return an array of all of the supplies that are used in the winter season
  all_winter_supplies = []
  holiday_hash[:winter].each{|holiday, array_of_supplies|
     array_of_supplies.each{|supply| all_winter_supplies.push(supply)}
   }
  all_winter_supplies
end

def all_supplies_in_holidays(holiday_hash)
  # iterate through holiday_hash and print items such that your readout resembles:
  # Winter:
  #   Christmas: Lights, Wreath
  #   New Years: Party Hats
  # Summer:
  #   Fourth Of July: Fireworks, BBQ
  # etc.

  holiday_hash.each{|season, holidays|
    puts "#{season.capitalize}:"
    holidays.each{|holiday_name, supplies|
      capitalized_holiday_name = holiday_name.to_s.split("_").collect{|word| word.capitalize}

        puts "  #{capitalized_holiday_name.join(" ")}: #{supplies.join(", ")}"

    }
  }
end

def all_holidays_with_bbq(holiday_hash)
  # return an array of holiday names (as symbols) where supply lists
  # include the string "BBQ"
  holidas_with_bbq = []
  holiday_hash.each{|season, holidays|
    holidays.each{|holiday_name, supplies|
      supplies.each{|supply|
        if supply == "BBQ"
          holidas_with_bbq.push(holiday_name)
        end
      }
    }
  }
  holidas_with_bbq
end

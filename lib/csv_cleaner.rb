Class CSVCleaner

  def zip_code_cleaner(row) #cleaner methods do the actual replacing of dirty data to clean data
      row[8] = format_zipcode(row[8])
    end
  end

  def format_zipcode(zipcode) #actually cleans the data. Does the actual cleaning
    zipcode.to_s.rjust(5,"0")[0..4]
  end

  def phone_number_sanitizer(data) #sanitizers are just switching code
    data.each do |data|
      data[4] = format_phone_number(data[4])
    end
  end

  def format_phone_number(phone_number)
    phone_number.to_s.gsub(/[^0-9]/, "").ljust(10,"0")[1..10]
  end

  def name_sanitizer(data)
    first_name_sanitizer(data)
    last_name_sanitizer(data)
  end

  def first_name_sanitizer(array)
    new_first_name = []
    new_first_name << array[1].downcase!
  end

  def last_name_sanitizer(data)
    new_last_name = []
    new_last_name << data[2].downcase!
  end

  def city_sanitizer(array) #this replaces data[6] with the new city name
    data[6] = format_city(data[6])
  end

  def format_city(city)
    if city.nil? || city == ""
      city_formatted = "City not provided"
    else
      city_formatted = city.downcase
    end
  end

  def state_sanitizer(array)
    data[7] = format_state(data[7])
  end

  def format_state(state)
    if state == nil || state == ""
      state = "State not provided"
    else
      state[0..1].upcase
    end
  end

  def self.regdate_sanitizer(data)
    data.each do |data|


    end
  end
end

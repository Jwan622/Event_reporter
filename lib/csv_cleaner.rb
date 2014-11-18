Class CSVCleaner

  def serial_number_swapper(dataset)
    dataset.each do |column|
      column[0] = clean_serial_number[column[0]]
    end
  end

  def clean_serial_number(serial)
    if serial.nil? || serial == ""
      serial = "00"
    else
      serial
    end
  end

  def regdate_swapper(dataset)
  end

  def name_swapper(dataset)
    dataset.each do |column|
      column[2] = clean_first_name(column[2])
      column[3] = clean_last_name(column[3])
    end
  end

  def email_swapper(dataset)
    dataset.each do |column|
      column[4] = clean_email(column[4])
  end

  def clean_first_name(name)
    new_first_name = ""
    new_first_name = name.strip.downcase
  end

  def clean_last_name(name)
    new_last_name = ""
    new_last_name = name.strip.downcase
  end

  def phone_number_swapper(dataset)
    dataset.each do |column|
      data[5] = clean_phone_number(column[5])
    end
  end

  def clean_phone_number(phone_number)
    phone_number.gsub(/[^0-9]/, "").ljust(10,"0")[0..9]
  end


  def zip_code_swapper(dataset)
    dataset.each do |column|
      column[9] = clean_format_zipcode(column[9])
    end
  end

  def clean_format_zipcode(zipcode)
    zipcode.rjust(5,"0")[0..4]
  end

  def city_sanitizer(dataset)
    dataset.each do |column|
    column[7] = clean_up_city(column[7])
  end

  def clean_up_city(city)
    if city.nil? || city == ""
      city_formatted = "City not provided"
    else
      city_formatted = city.downcase
    end
  end

  def state_sanitizer(dataset)
    dataset.each do |column|
    data[8] = clean_up_state(column[8])
  end

  def clean_up_state(state)
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

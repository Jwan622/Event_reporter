require 'csv'

class CSVHandler
  attr_accessor :data

  def initialize()
    @data = []
  end

  def load_file(filename)
    CSV.foreach(filename, headers: true, header_converters: :symbol) do |row|
      data << [
        row[:serial], row[:regdate],row[:first_name],row[:last_name],row[:email_address],row[:homephone],
        row[:street],row[:city],row[:state],row[:zipcode]
      ]
    end
  end

  def save_file(filename, data)  #filename stands for new file name.
    File.open(filename, "w") do |file|
      file.puts csv_header
    end

    File.open(filename, 'a') do |file|
      data.each do |row|
        file.puts data_convert_to_string(row)  #so we're dating data which right now is a long single array of elements, and
                                          #we're puts'ing to a file an interpolated string
      end
    end
  end


  #   Dir.mkdir("output") unless Dir.exists? "output"
  #
  #   filename = "output/thanks_#{id}.html"
  #
  #   File.open(filename,'w') do |file|
  #     file.puts form_letter
  #   end

  def data_convert_to_string(data)
    "#{data[0]},#{data[1]},#{data[2]},#{data[3]},#{data[4]},#{data[5]},#{data[6]},#{data[7]},#{data[8]},#{data[9]}"
  end

  def csv_header
    "Serial,RegDate,first_Name,last_Name,Email_Address,HomePhone,Street,City,State,Zipcode"
  end

end




CLI
reader = CSVHandler.new


until quit?
def cli load
  reader.load_file(filename)
end

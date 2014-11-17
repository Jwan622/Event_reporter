
require 'csv'

def clean_zipcode(zipcode)
  zipcode.to_s.rjust(5, "0")[0..4]  # I think the key to refactoring here is realizing that the [0..4] method and the rjust
end                                    # method do not overlap on the same range of cases. [0..4] applies to when the string
                                    # is 5 digits or greater. I think the point is that the two methods do not overlap and
                                    #create unintended affects. So you don't need to use if/else statements. The methods
                                    # don't overlap anyway.

puts "EventManager initialized."
contents = CSV.open "event_attendees_small.csv", headers: true, header_converters: :symbol

contents.each do |row|
  name      = row[:first_name]
  zipcode   = clean_zipcode(row[:zipcode])
  puts "#{name} #{zipcode}"

puts File.exist?("event_attendees.csv")




=begin
Using CSV.open:
Instead of read or readlines we use CSV’s open method to load our file. The library
also supports the concept of headers and so we provide some additional parameters which state
this file has headers.


You can do something like this:

contents = CSV.open "event_attendees.csv", headers: true, header_converters: :symbol

Converting the headers to symbols will make our column names more uniform and easier to remember.
The header ‘first_Name’ will be converted to :first_name
Accessing the zipcode is very easy using the header name.
‘Zipcode’ becomes :zipcode

contents = CSV.open "event_attendees.csv", headers: true, header_converters: :symbol
contents.each do |row|
  name = row[:first_name]
  zipcode = row[:zipcode]
  puts "#{name} #{zipcode}"
end
=end



=begin
This is how to write to a file:
fname = "sample.txt"
somefile = File.open(fname, "w")
somefile.puts "Hello file!"
somefile.close

or

somefile = File.open("sample.txt", "w")
somefile.puts "Hello file!"
somefile.close

Difference between "r", "w", "a" for file.open:
Warning: Using "w" mode on an existing file will erase the contents of that file.
If you want to append to an existing file, use "a" as the second argument.

=end



=begin
using blocks for File.open:

Instead of assigning a file handle to a variable, like so:

somefile = File.open("sample.txt", "w")
somefile.puts "Hello file!"
somefile.close
You can use the block convention with File.open:


File.open("sample.txt", "w"){ |somefile| somefile.puts "Hello file!"}

=end



=begin
This is how you check if its end of file:
The File class (more specifically, the IO class that File inherits from) contains the eof?
method, which returns true if there is no more data in the file to read.

file = File.open("sample.txt", 'r')
while !file.eof?
   line = file.readline
   puts line
end

=end




=begin
When dealing with delimited files, such as comma-delimited text files, it's more
convenient to read the file line by line. The readlines method can draw in all the content
and automatically parses it as an array, splitting the file contents by the line breaks.

File.open("sample.txt").readlines.each do |line|
  puts line
end

=end

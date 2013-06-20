#require 'pry'
require 'csv'

require_relative '../app/models/legislator'

class SunlightLegislatorsImporter
  def self.import(filename)
    government_critters = []
    csv = CSV.new(File.open(filename), :headers => true, :header_converters => :symbol)
    csv.each do |row|
      name = "#{row[:firstname]} #{row[:lastname]}"
      government_critters << { title:     row[:title],
                               name:      name,
                               email:     row[:email],
                               phone:     row[:phone],
                               fax:       row[:fax],
                               website:   row[:website],
                               webform:   row[:webform],
                               party:     row[:party],
                               gender:    row[:gender],
                               birthdate: row[:birthdate],
                               twitter_id:row[:twitter_id],
                               state:     row[:state],
                               in_office: row[:in_office]
                              }
 #                             binding.pry
    end
      government_critters.each { |hash| Legislator.create!(hash)}
      
      #raise NotImplementedError, "TODO: figure out what to do with this row and do it!"
  end
end

# IF YOU WANT TO HAVE THIS FILE RUN ON ITS OWN AND NOT BE IN THE RAKEFILE, UNCOMMENT THE BELOW
# AND RUN THIS FILE FROM THE COMMAND LINE WITH THE PROPER ARGUMENT.
# begin
#   raise ArgumentError, "you must supply a filename argument" unless ARGV.length == 1
#   SunlightLegislatorsImporter.import(ARGV[0])
# rescue ArgumentError => e
#   $stderr.puts "Usage: ruby sunlight_legislators_importer.rb <filename>"
# rescue NotImplementedError => e
#   $stderr.puts "You shouldn't be running this until you've modified it with your implementation!"
# end

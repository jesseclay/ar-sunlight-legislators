require 'csv'
require_relative '../app/models/legislator'

class Hash
  def symbolize_keys
    dup.symbolize_keys!
  end

  def symbolize_keys!
    keys.each do |key|
      self[(key.to_sym rescue key) || key] = delete(key)
    end
    self
  end
end


class SunlightLegislatorsImporter
  def self.import(filename)
    csv = CSV.new(File.open(filename), :headers => true)
    csv.each do |row|

      legislator = Legislator.new()
      legislator_values = Hash[row]
      legislator_values.symbolize_keys!
      legislator_values.select! {|key| [:type, :title, :firstname,:middlename,
                                        :lastname,:name_suffix,:party,:state,
                                        :gender,:phone,:fax,:webform,:website,
                                        :twitter_id,:youtube_url,:facebook_id,
                                        :birthdate].include?(key)}
      legislator.update_attributes(legislator_values)
    end
  end
end

# IF YOU WANT TO HAVE THIS FILE RUN ON ITS OWN AND NOT BE IN THE RAKEFILE, UNCOMMENT THE BELOW
# AND RUN THIS FILE FROM THE COMMAND LINE WITH THE PROPER ARGUMENT.
begin
  raise ArgumentError, "you must supply a filename argument" unless ARGV.length == 1
  SunlightLegislatorsImporter.import(ARGV[0])
rescue ArgumentError => e
  $stderr.puts "Usage: ruby sunlight_legislators_importer.rb <filename>"
rescue NotImplementedError => e
  $stderr.puts "You shouldn't be running this until you've modified it with your implementation!"
end

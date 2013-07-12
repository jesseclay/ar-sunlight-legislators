require_relative 'models/legislator'

Legislator.all.each do |legislator|
  if legislator.state == "CA" && legislator.title == "Sen" && legislator.party == "D"
    puts legislator.name + " (#{legislator.party})"
  end
end

p Legislator.where(state: 'CA').take
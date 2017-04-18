require 'csv'

filepath = 'data/beers.csv'

csv_options = {
  col_sep: ',',
  quote_char: '"',
  headers: :first_row
}

beers = []
CSV.foreach(filepath, csv_options) do |row|
   beers << row.to_h

  # puts "#{row[0]} | #{row[1]} | #{row[2]}"
end
p beers


CSV.open(filepath, 'wb', csv_options) do |csv|
  csv << ['Name', 'Appearance', 'Origin']
  
  beers.each do |beer|
    csv << [ beer['Name'], beer['Appearance'], beer['Origin'] ]
  end

  csv << ['Asahi', 'Pale Lager', 'Japan']
  csv << ['Guinness', 'Stout', 'Ireland']
  # ...
end


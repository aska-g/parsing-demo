require 'json'

filepath    = 'data/beers.json'
serialized_beers = File.read(filepath)

# beers = JSON.parse(serialized_beers)

beers = { beers: [
  {
    name:       'Edelweiss',
    appearance: 'White',
    origin:     'Austria'
  },
  {
    name:       'Guinness',
    appearance: 'Stout',
    origin:     'Ireland'
  }
  # etc...
]}

p JSON.generate(beers)

File.open(filepath, 'wb') do |file|
  file.write(JSON.generate(beers))
end
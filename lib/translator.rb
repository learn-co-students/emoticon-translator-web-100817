# require modules here
require 'yaml'

require 'pry'


def load_library(file)
  thing = YAML.load_file(file)


emolib = Hash.new
emolib["get_emoticon"] = {}
emolib["get_meaning"] = {}

thing.each do |k, v|
  emolib["get_emoticon"][v.first] = v.last
  emolib["get_meaning"][v.last] = k
end


return emolib
end

def get_japanese_emoticon(file, emoticon)
defcon = load_library(file)
japemo = defcon["get_emoticon"]["#{emoticon}"]
if japemo == nil
  return "Sorry, that emoticon was not found"
else
  return japemo
end

end

def get_english_meaning(file, emoticon)
  defcon = load_library(file)
  engemo = defcon["get_meaning"]["#{emoticon}"]
  if engemo == nil
    return "Sorry, that emoticon was not found"
  else
    return engemo
  end
end

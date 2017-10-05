# require modules here
require "yaml"

def load_library(file_path)
  library = YAML.load_file(file_path)

  new_hash = {
   "get_meaning" => {},
   "get_emoticon" => {}
 }
 library.each do |meaning, translation|
   english = translation[0]
   japanese = translation[1]
   new_hash["get_meaning"][japanese] = meaning
   new_hash["get_emoticon"][english] = japanese
 end
  return new_hash
end


def get_japanese_emoticon(file_path, emoticon)
  library = load_library(file_path)
  result = library["get_emoticon"][emoticon]
  if result
      return result
  else return "Sorry, that emoticon was not found"
  end
end


def get_english_meaning(file_path, emoticon)
  library = load_library(file_path)
  result = library["get_meaning"][emoticon]
  if result
      return result
  else return "Sorry, that emoticon was not found"
  end
end

# require modules here
require 'pry'
require 'yaml'

def load_library(path)
  library = YAML.load_file(path)
    library.each_with_object({}) do |(meaning,emoticon),new_hash|
    new_hash["get_meaning"] ||= {}
    new_hash["get_emoticon"] ||= {}
    new_hash["get_meaning"][emoticon[1]] = meaning
    new_hash["get_emoticon"][emoticon[0]] = emoticon[1]
  end
  # code goes here
end

def get_japanese_emoticon(path,emoticon)
  library = load_library(path)
  if library["get_emoticon"].key?(emoticon)
    return library["get_emoticon"][emoticon]
  else
   return "Sorry, that emoticon was not found"
  end

  # code goes here
end

def get_english_meaning(path,emoticon)
  # code goes here
  library = load_library(path)
  if library["get_meaning"].key?(emoticon)
    return  library["get_meaning"][emoticon]
  else
    return "Sorry, that emoticon was not found"
  end
end

require 'pry'
require 'yaml'

def load_library(yaml)
  translation = {"get_emoticon" => {}, "get_meaning" => {}}
  emoticons = YAML.load_file(yaml)
  emoticons.each do |meaning, symbol_array|
    translation["get_emoticon"][symbol_array[0]] = symbol_array[1]
    translation["get_meaning"][symbol_array[1]] = meaning
  end
   translation
end

def get_japanese_emoticon(yaml, emoticon)
  translation = load_library(yaml)
  if translation["get_emoticon"][emoticon] == nil
    "Sorry, that emoticon was not found"
  else
    translation["get_emoticon"][emoticon]
  end
end

def get_english_meaning(yaml, emoticon)
  translation = load_library(yaml)
  if translation["get_meaning"][emoticon] == nil
    "Sorry, that emoticon was not found"
  else
    translation["get_meaning"][emoticon]
  end
end

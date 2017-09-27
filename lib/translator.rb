# require modules here
  require "yaml"

  require 'pry'
def load_library(file)
  emoticons = YAML.load_file('./lib/emoticons.yml')

  new_hash = {"get_meaning" => {}, "get_emoticon" => {}}

  emoticons.each do |meaning, icon|
    japanese = icon[1]
    english = icon[0]
    new_hash["get_meaning"][japanese] = meaning  #keys are japanese emojis, values are the meanings
    new_hash["get_emoticon"][english] = japanese #keys are english emoticons, values are japanese emoticons
  end

  new_hash
end

def get_japanese_emoticon(file, emoticon)
      answer = load_library(file)
  if answer["get_emoticon"].include?(emoticon)
     answer["get_emoticon"][emoticon]
  else
    "Sorry, that emoticon was not found"
  end
end

def get_english_meaning(file, emoticon)
  answer = load_library(file)
  if answer["get_meaning"].include?(emoticon)
    answer["get_meaning"][emoticon]
  else
    "Sorry, that emoticon was not found"
  end 
end

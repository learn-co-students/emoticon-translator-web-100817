require 'yaml'

def load_library(file_path)
  emoticons = YAML.load_file(file_path)
  emoji = emoticons
  'get_meaning'= {}
  'get_emoticon' = {}
  emoji.each do |word, emot|
    get_meaning[emot[1]] = word
end
get_meaning
end

def get_japanese_emoticon
  # code goes here
end

def get_english_meaning
  # code goes here
end

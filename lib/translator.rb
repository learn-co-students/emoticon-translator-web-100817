# require modules here
require "yaml"

def load_library(path)
  # code goes here
  data = {"get_emoticon" => {}, "get_meaning" => {} }
  YAML.load_file(path).each do |mean, ej|
    data["get_emoticon"][ej[0]] = ej[1]
    data["get_meaning"][ej[1]] = mean
  end
  data
end

def get_japanese_emoticon(path, emo)
  # code goes here
  data = load_library(path)
  if data["get_emoticon"].key?(emo)
    data["get_emoticon"][emo]
  else
    "Sorry, that emoticon was not found"
  end
end

def get_english_meaning(path, emo)
  # code goes here
  data = load_library(path)
  if data["get_meaning"].key?(emo)
    data["get_meaning"][emo]
  else
    "Sorry, that emoticon was not found"
  end
end

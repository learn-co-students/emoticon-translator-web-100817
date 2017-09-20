# require modules here
require "yaml"
require "pry"
def load_library(path)
  lib = {"get_meaning" => {},"get_emoticon" => {}}
  load = YAML.load_file(path)
  load.each do |exp, em_arr|
    lib["get_meaning"][em_arr[1]] = exp.to_s
    lib["get_emoticon"][em_arr[0]] = em_arr[1]
  end
  lib
  #binding.pry
end

def get_japanese_emoticon(path, emoticon)
  lib = load_library(path)
  lib["get_emoticon"].each do |eng, jap|
    return jap if emoticon == eng
  end
  "Sorry, that emoticon was not found"
end

def get_english_meaning(path, emoticon)
  load_library(path)["get_meaning"].each {|jap, eng| return eng if emoticon == jap}
  "Sorry, that emoticon was not found"
end

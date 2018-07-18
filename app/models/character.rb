class Character < ApplicationRecord

  def self.dead_by_gender
    dead_characters = Character.where(dead: true)
    gender_split = {male: 0, female: 0 }
    dead_characters.each do |char|
      if char.gender == "Male"
        gender_split[:male] += 1
      elsif char.gender == "Female"
        gender_split[:female] += 1
      end
    end
    output  = []
    gender_split.each_key do |gender|
      node = {x: gender, y: gender_split[gender]}
      output << node
    end
    output
  end

  def self.dead_by_name
    dead_characters = Character.where(dead: true)
    names = {}
    dead_characters.each do |char|
      last_name = char[:name].split(" ")[1]
      letter = char[:name] ? char[:name][0] : null
      if names[letter]
        names[letter] += 1
      else
        names[letter] = 1
      end
    end
    output  = []
    names.each_key do |l|
      node = {x: l, y: names[l]}
      output << node
    end
    output
  end

  def self.dead_by_culture
    dead_characters = Character.where(dead: true)
    cultures = {}
    dead_characters.each do |char|
      culture = char[:culture]
      if culture != ""
        if cultures[culture]
          cultures[culture] += 1
        else
          cultures[culture] = 1
        end
      end
    end
    output  = []
    cultures.each_key do |cult|
      node = {x: cult, y: cultures[cult]}
      output << node
    end
    output
  end


end

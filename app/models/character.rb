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
    gender_split
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
    names
  end

  def self.dead_by_culture
    dead_characters = Character.where(dead: true)
    cultures = { "None" => 0 }
    dead_characters.each do |char|
      culture = char[:culture]
      if culture != ""
        if cultures[culture]
          cultures[culture] += 1
        else
          cultures[culture] = 1
        end
      else
        cultures["None"] += 1
      end
    end
      cultures
  end


end

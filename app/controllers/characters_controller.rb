class CharactersController < ApplicationController

  def index
    dead_characters = Character.where(dead: true)
    render json: dead_characters, status: 200
  end

  def gender
    by_gender = Character.dead_by_gender
    render json: by_gender, status: 200
  end

  def name
    by_name = Character.dead_by_name
    render json: by_name, status: 200
  end

  def culture
    by_culture = Character.dead_by_culture
    render json: by_culture, status: 200
  end

end

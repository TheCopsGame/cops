# frozen_string_literal: true

class CharactersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_character, only: [:destroy, :edit, :new, :update]

  def index
    @characters = Character.with_attached_avatar
  end

  def show
    @character = Character.find_by(id: params[:id])
  end

  def new
    if @character
      redirect_to characters_url, alert: t('.character_already_exists')
    else
      @character = Character.new
    end
  end

  def edit; end

  def create
    @character = Character.new(character_params)
    @character.user = current_user

    if @character.save
      redirect_to @character, notice: t('.success')
    else
      render :new
    end
  end

  def update
    if @character.update(character_params)
      redirect_to @character, notice: t('.success')
    else
      render :edit
    end
  end

  def destroy
    @character.destroy

    redirect_to characters_url, notice: t('.success')
  end

  private

  def set_character
    @character = current_user.character
  end

  def character_params
    params.require(:character).permit(
      :name,
      :level,
      :experience,
      :energy,
      :money,
      :strength,
      :agility,
      :intelligence,
      :avatar
    )
  end
end

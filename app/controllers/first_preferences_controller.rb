class FirstPreferencesController < ApplicationController

  def show
    @preferences = FirstPreferences.formals
    @informals = FirstPreferences.informals
  end

end
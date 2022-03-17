class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :join ]

  def home
  end

  def join
  end
end

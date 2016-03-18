class HomeController < ApplicationController
  
  # Разрешено только для авторизованных пользователей
  before_filter :authenticate_user!, except: [:index]

  def index
    # Здесь ничего нет
  end
  
end

class RpgController < ApplicationController
  def index
    if session[:gold].nil?
      session[:gold] = 0
    end
    if session[:message].nil?
      session[:message] = []
    end
  end
  def farm
    n = rand(10..20)
    session[:gold] += n 
    session[:message] << "<p class='text-success'>Earned #{n} gold from the farm! (#{Time.now.strftime("%e %b %Y %H:%M:%S%p")})</p>"
    redirect_to '/'
  end
  def cave
    n = rand(5..10)
    session[:gold] += n
    session[:message] << "<p class='text-success'>Earned #{n} gold from the cave! (#{Time.now.strftime("%e %b %Y %H:%M:%S%p")})</p>"
    redirect_to '/' 
  end
  def house
    n = rand(2..5)
    session[:gold] += n
    session[:message] << "<p class='text-success'>Earned #{n} gold from the house! (#{Time.now.strftime("%e %b %Y %H:%M:%S%p")})</p>"
    redirect_to '/'
  end 
  def casino
    n = rand(-50..50)
    session[:gold] += n
    if n > -1
      session[:message] << "<p class='text-success'>Earned #{n} gold from the casino! (#{Time.now.strftime("%e %b %Y %H:%M:%S%p")})</p>"
    else
      session[:message] << "<p class='text-danger'>Earned #{n} gold from the casino! (#{Time.now.strftime("%e %b %Y %H:%M:%S%p")})</p>"
    end
    redirect_to '/'
  end
end

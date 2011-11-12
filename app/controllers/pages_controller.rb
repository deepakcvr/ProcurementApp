class PagesController < ApplicationController
  def home
  	@title = "Home"
  end

  def sell
  	@title = "Sell"
  end

  def buy
  	@title = "Buy"
  end

  def contact
  	@title = "Contact"
  end

end

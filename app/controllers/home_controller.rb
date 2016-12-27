class HomeController < ApplicationController
  def index

  end
  def there
      @data = params[:text1]
    end


end

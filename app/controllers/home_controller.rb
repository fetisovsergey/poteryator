class HomeController < ApplicationController
before_action :get_location, only: :index
  def index
	@things = Thing.all
	if signed_in?
        @map = Map.new
    end
  end
end

class ApplicationController < ActionController::Base
	  before_action :authenticate_customer!, except: [:index,:show]
end

class Admin::BaseAdminController < ApplicationController
  protect_from_forgery with: :exception
  # before_action :authenticate_admin!
end

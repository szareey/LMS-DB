class GeneralController < ApplicationController
  skip_before_filter :is_approved

  def index
  end
end

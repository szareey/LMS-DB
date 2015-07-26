class LessonsController < ApplicationController

  before_action :permission, only: [:destroy, :create, :new]

  

end
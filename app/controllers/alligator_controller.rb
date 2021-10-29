class AlligatorController < ApplicationController

  def show
    render json: {
      name: "Betty"
    }
  end

  def index
    render json: [{
      name: "Betty"
    }]
  end
end

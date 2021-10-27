class AlligatorController < ApplicationController

  def show
    render json: {
      name: "Betty"
    }
  end
end

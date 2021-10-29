class AlligatorController < ApplicationController

  def show
    render json: {
      name: "Betty"
    }
  end

  def index
    json = Array(params[:name]).map do |name|
      { name: "#{name}y" }
    end
    render json: json
  end
end

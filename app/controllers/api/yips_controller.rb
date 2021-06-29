class Api::YipsController < ApplicationController
    def index
        @yips = Yip.all.includes(:author)
        # render json: @yips
        render :index
    end

    def create
        @yip = Yip.new(yip_params)
        @yip.author = User.first
        if @yip.save
            render json: @yip
        else
            render json: @yip.errors.full_messages, status: 422
        end
    end

    def show
        @yip = Yip.find(params[:id])
        render :show
    end

    private

    def yip_params
        params.require("yip").permit(:body)
    end
end

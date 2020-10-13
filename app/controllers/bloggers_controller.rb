class BloggersController < ApplicationController

    def index
        @bloggers = Blogger.all
    end

    def show 
        @blogger = Blogger.find(params[:id])
    end

    def create
        blogger = Blogger.create(blogger_params)
        redirect_to blogger_path(blogger)
    end

    def new 
        @blogger = Blogger.new
    end
    

    private

    def blogger_params
        params.require(:blogger).permit(:name, :age, :bio)
    end
end
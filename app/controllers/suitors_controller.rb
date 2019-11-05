class SuitorsController < ApplicationController

    def new
        @suitor = Suitor.new
    end

    def create
        @suitor = Suitor.new(suitor_params)

        if @suitor.save
            redirect_to suitor_path(@suitor)
        else
            render :new
        end
    end

    def index
        @suitors = Suitor.all
    end

    def show
        @suitor = Suitor.find_by(id: params[:id])
    end

    private

    #for security purposes
    def suitor_params
        params.require(:suitor).permit(:name, :occupation, :age)
    end
end
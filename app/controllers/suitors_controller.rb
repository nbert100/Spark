class SuitorsController < ApplicationController

    def new
        redirect_if_not_logged_in
        @suitor = Suitor.new
    end

    def create
        @suitor = Suitor.new(suitor_params)
        if @suitor.save 
            redirect_to suitors_path
        else
            render :new
        end
    end

    def index
        @suitors = Suitor.all
    end

    def show
        set_suitor
    end

    
    def destroy
        set_suitor
        @suitor.destroy
        redirect_to suitors_path
    end

    private

    def suitor_params
        params.require(:suitor).permit(:name, :occupation, :age, :hometown, :dating_app)
    end

    def set_suitor
        @suitor = Suitor.find_by(id: params[:id])
        if !@suitor
            redirect_to suitors_path
        end
        
    end
end
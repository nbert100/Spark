class SuitorsController < ApplicationController

    def new
        @suitor = Suitor.new
    end

    def create
        @suitor = Suitor.new(suitor_params(:name, :age, :occupation))
        if @suitor.save
            redirect_to suitor_path(@suitor)
        else
            raise.inspect
            render :new
        end
    end

    def index
        @suitors = Suitor.all
    end

    def show
        set_suitor
    end

    def edit
        set_suitor
    end

    def update
        set_suitor
        if @suitor.update(suitor_params(:occupation))
            redirect to suitor_path(@suitor)
        else
            render :edit
        end
    end

    def destroy
        set_suitor
        @suitor.destroy
        redirect_to suitors_path
    end

    private

    #for security purposes
    # def suitor_params
    #     params.require(:suitor).permit(:name, :occupation, :age)
    # end

    def suitor_params(*args)
        params.require(:suitor).permit(*args)
    end

    def set_suitor
        @suitor = Suitor.find_by(id: params[:id])
        if !@suitor
            redirect_to suitors_path
        end
        #for dynamic routes
    end
end
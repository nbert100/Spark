class SuitorsController < ApplicationController

    # def new
    #     @suitor = Suitor.new
    # end

    # def create
    #     @suitor = Suitor.new(suitor_params)
    #     if @suitor.save
    #         redirect_to suitor_path(@suitor)
    #     else
    #         render :new
    #     end
    # end

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
        # if @suitor.update(suitor_params(:oc))
        #     redirect_to suitor_path(@suitor)
        # else
        #     render :edit
        # end
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
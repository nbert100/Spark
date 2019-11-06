class MeetingsController < ApplicationController
    def new
        @meeting = Meeting.new
    end
    
    def create
        @meeting = current_user.meetings.build(meeting_params)
        if @meeting.save
            redirect_to meeting_path(@meeting)
        else
            render :new
        end
    end

    def index
        @meetings = Meeting.all
    end

    def show
        set_meeting
    end

    def edit
        set_meeting
    end

    def update
        set_meeting
    end

    def destroy
    end

    private 
    def meeting_params
        params.require(:meeting).permit(:venue, :location, :appointment, :user_id, :suitor_id, :rating, :note)
    end

    def set_meeting
        @meeting = Meeting.find_by(id: params[:id])
        if !@meeting
            redirect_to meetings_path
        end
    end
end

class MeetingsController < ApplicationController
    def new
        #check if nested and an actual id
        if params[:suitor_id] && suitor = Suitor.find_by_id(params[:suitor_id])
        #nested route
        @meeting = suitor.meetings.build
        else
            #unnested route
        @meeting = Meeting.new
        end
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
        if params[:suitor_id] && suitor = Suitor.find_by_id(params[:suitor_id])
            @meetings = suitor.meetings
        else
            @meetings = Meeting.all
        end

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

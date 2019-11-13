class MeetingsController < ApplicationController
    
    def new
        redirect_if_not_logged_in
        if params[:suitor_id] && suitor = Suitor.find_by_id(params[:suitor_id])
            @meeting = suitor.meetings.build 
        else
            @meeting = Meeting.new
            @meeting.build_suitor  
        end
    end
    
    def create
        @meeting = current_user.meetings.build(meeting_params)
        if @meeting.save
            redirect_to meeting_path(@meeting)
        else
            @meeting.build_suitor unless @meeting.suitor
            render :new
            
        end
    end

    def index
        if params[:suitor_id] && suitor = Suitor.find_by_id(params[:suitor_id])
            @meetings = suitor.meetings.most_recent
        else
            @meetings = Meeting.most_recent
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
        if @meeting.update(meeting_params)
            redirect_to meeting_path(@meeting)
        else
            render :edit
        end
    end

    def destroy
        set_meeting
        @meeting.destroy
        redirect_to user_path(current_user)
    end

    private 
    def meeting_params
        params.require(:meeting).permit(:venue, :location, :appointment, :user_id, :suitor_id, :rating, :note, suitor_attributes: [:name, :occupation, :age, :dating_app, :hometown])
    end

    def set_meeting
        @meeting = Meeting.find_by(id: params[:id])
        if !@meeting
            redirect_to meetings_path
        end
    end
end

module ApplicationHelper

    
    def current_user
        @current_user ||= User.find_by_id(session[:user_id])
    end

    def logged_in?
        !!current_user
    end

    def authorized_to_edit?(object)
        object.user == current_user
    end

    def redirect_if_not_logged_in
        if !logged_in?
            flash[:error] = "Please log in to view this page"
            redirect_to '/'
        end
    end
end

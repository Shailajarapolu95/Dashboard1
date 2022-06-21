module UserHelper
    def current_user
        User.find_by_id(session[:user_id] )
        User.first
    end
end

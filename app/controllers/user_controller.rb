class UserController < ApplicationController
 include UserHelper
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice]="Signup successful"
      redirect_to '/login'
    else
      Rails.logger.info @user.errors.full_messages
      flash[:notice]= @user.errors.full_messages
      redirect_to '/signup'
    end
  end
  def new
    @user = User.new
  end

  def index
    @books = Book.all
    @customers=Customer.all
    @sports= Sport.all
    @resumes=Resume.all
    response = HTTParty.get("http://api.weatherstack.com/current?access_key=5c8c1958b54deb874ab63dce4c5e5b78&query=New%20York")
    Rails.logger.info response.code
    Rails.logger.info response.body
    Rails.logger.info response.to_a
    a =JSON.parse(response.body)
    @query = a["request"]["query"]
    @WindSpeed = a["current"]["wind_speed"]
    @Precip = a["current"]["precip"]
    @Pressure = a["current"]["pressure"]
    @Humidity = a["current"]["humidity"]
    @Visibility = a["current"]["visibility"]
  end
  
  private
    def user_params
      params.require(:user).permit(:first_name, :last_name, :user_name, :email, :password)
    end
end

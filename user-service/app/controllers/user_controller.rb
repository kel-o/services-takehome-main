require 'uri'
require 'net/http'


class UserController < ApplicationController
 before_action :get_user
 
 def index
   render json: USERS
 end
  def show
   if @user then
     render json: {
       "full_name": "#{@user.first_name} #{@user.last_name}",
       "meeting_count": @user.meetings.count,
       "next_meeting_details": {"name": next_meeting.name, "date": next_meeting.starts_at} ,
       "subscription_cost": @user.subscription.cost,
       "days_until_subscription_renewal": ""
     }
   else
     render json: { "message": "User not found" }, status: :not_found
   end
 end


 private


 def next_meeting
   next_meeting = @user.meetings.pluck(:starts_at).min
   next_meeting_details = Meeting.where(starts_at: next_meeting).last
 end


 def get_user
   @user = User.find(params[:user_id])
 end
end

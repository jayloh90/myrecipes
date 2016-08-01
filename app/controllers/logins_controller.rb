class LoginsController < ApplicationController
    
    def new
    end
    
    def create
      chef = Chef.find_by(email: params[:email])#no need to use instance variable because we are not performing any CRUD actions
      if chef && chef.authenticate(params[:password])
        session[:chef_id] = chef.id
        flash[:success] = "You are logged in"
        redirect_to recipes_path
      else
        flash.now[:danger] = "Your email address or password does not match"
        render 'new'
      end 
    end
    
    def destroy
      session[:chef_id] = nil
      flash[:success] = "You have logged out"
      redirect_to root_path
    end
end

#binding.pry (useful to check what is in params)
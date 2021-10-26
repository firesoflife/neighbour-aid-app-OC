class SessionsController < ApplicationController

    def create
        @user = User.find_by(email: session_params[:email])

        if @user && @user.authenticate(session_params[:password])
            login!
            render json: {
                logged_in: true,
                user: @user
            }
        else
            render json: {
                status: 401,
                errors: ['no such user', 'verify credentials and try again or signup']
            }
        end
    end

    def is_logged_in?
        if logged_in? && current_user
            render json: {
                logged_in: true,
                user: current_user
            }
        else
            render json: {
                logged_in: flase,
                message: 'user does not exist'
            }
        end
    end

    def destroy
        logout!
        render json: {
            status: 200,
            logged_out: true
        }
    end

    # def update
    #     @user = User.find(params[:id])

    #     if @user.update_attributes(user_params)
    #         redirect_to :action => 'show', :id => @user
    #     else
            # render json: {
            #     status: 401,
            #     errors: ['no such user', 'verify credentials and try again or signup']
            # }
    # end

    private

    def session_params
        params.require(:user).permit(:username, :email, :password)
    end

end
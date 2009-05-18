class SessionsController < ApplicationController
	def new
	end
	
	def create		
		@user = User.logon(params[:login], params[:password])
		if @user
			session[:user_id] = @user.id
			destiny = session[:return_to] || root_path
      flash.clear
			redirect_to destiny
		else
			flash[:error] = "Falha na autenticação! Usuário ou senha inválido!"
			render :action => "new"
		end
	end
	
	def destroy   
    session[:user_id] = nil
		redirect_to new_session_path
	end

end

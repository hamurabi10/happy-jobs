class ProfilesController < ApplicationController
  def create
    if params[:user][:username] && params[:user][:password]
      respond_to do |format|
        user = User.new(username: params[:user][:username], password: params[:user][:password])
        if user.save
          profile = Profile.new(profile_params)
          profile.user_id = user.id
          if profile.save
            format.html {redirect_to company_url(params[:profile][:company_id]), notice: 'Usuario creado.'}
          else
            format.html {redirect_to company_url(params[:profile][:company_id]), notice: 'Hubo un error al crear el perfil.'}
          end
        else
          format.html {redirect_to company_url(params[:profile][:company_id]), notice: 'Hubo un error al crear el usuario.'}
        end
      end
    else
      redirect_to company_url(params[:profile][:company_id])
    end
  end

  def login
  end

  def access
    if params[:user][:username] && params[:user][:password]
      password = Digest::SHA512.hexdigest(params[:user][:password])
      if User.exists?(username: params[:user][:username], password: password)
        user = User.where(username: params[:user][:username]).first
        session[:current_user] = user.id
        redirect_to departments_url
      else
        redirect_to login_url
      end
    else
      redirect_to login_url
    end
  end

  def status
    if params[:id] && params[:status]
      user = User.find(params[:id])
      user.update(status: params[:status])
      redirect_to company_url(session[:current_company])
    end
  end

  private
    def profile_params
      params.require(:profile).permit(:names, :email, :avatar, :company_id, :phone)
    end
end

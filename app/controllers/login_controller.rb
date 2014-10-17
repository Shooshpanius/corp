class LoginController < ApplicationController
  def index
  end

  def srv_check_login

    domain = Domain.first

    require 'net/ldap'
    ldap = Net::LDAP.new :host => domain.host,
                         :port => domain.port,
                         :auth => {
                             :method => :simple,
                             :username => params[:login].to_s+'@'+domain.name.to_s,
                             :password => params[:password]
                         }

    if ldap.bind

      filter = Net::LDAP::Filter.eq('samaccountname', params[:login])
      ldap.search(:base => 'OU=WUsers,DC=wood,DC=local', :filter => filter, :return_result => true) do |entry|
        #givenName = entry.try(:givenName).to_s.strip.sub(/(\[\")/,'').sub(/(\"\])/,'')
        #sn = entry.try(:sn).to_s.strip.sub(/(\[\")/,'').sub(/(\"\])/,'')
        #username = entry.try(:username).to_s.strip
        #sAMAccountName = entry.try(:sAMAccountName).to_s.strip.sub(/(\[\")/,'').sub(/(\"\])/,'')
        #office = entry.try(:office).to_s.strip
        #@mail = entry.try(:mail).to_s.strip.sub(/(\[\")/,'').sub(/(\"\])/,'')
        #title = entry.try(:title).to_s.strip.sub(/(\[\")/,'').sub(/(\"\])/,'')
        #department = entry.try(:department).to_s.strip.sub(/(\[\")/,'').sub(/(\"\])/,'')


        user = User.find_by_login(params[:login])
        if user

        else
          user = User.new(
              login: params[:login]
          )
          user.save

        end

        session[:is_login] = true
        session[:user_id] = user.id
        session[:user_login] = params[:login]
        session[:is_admin] = true if user.admin


      end

    else

    end

  end



  def srv_logout
    reset_session
    cookies.delete :hash
    render :nothing => true
  end

end


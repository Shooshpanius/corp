class Cron::AddressBookCorpParserController < ApplicationController


  def index


    domain = Domain.first

    require 'net/ldap'
    ldap = Net::LDAP.new :host => domain.host,
                         :port => domain.port,
                         :auth => {
                             :method => :simple,
                             :username => domain.parser_user.to_s+'@'+domain.name.to_s,
                             :password => domain.parser_password
                         }


    # filter = Net::LDAP::Filter.eq("mail", @e_from)
    # attrs = ["givenName", "sn", "physicalDeliveryOfficeName", "sAMAccountName", "mail", "title", "department"]
    i = 0
    ldap.search(:base => "OU=WUsers,DC=wood,DC=local",  :return_result => true) do |entry|

      i += i
      givenName = entry.try(:givenName).to_s.strip.sub(/(\[\")/,'').sub(/(\"\])/,'')
      sn = entry.try(:sn).to_s.strip.sub(/(\[\")/,'').sub(/(\"\])/,'')
      #username = entry.try(:username).to_s.strip
      sAMAccountName = entry.try(:sAMAccountName).to_s.strip.sub(/(\[\")/,'').sub(/(\"\])/,'')
      #office = entry.try(:office).to_s.strip
      email = entry.try(:mail).to_s.strip.sub(/(\[\")/,'').sub(/(\"\])/,'')
      title = entry.try(:title).to_s.strip.sub(/(\[\")/,'').sub(/(\"\])/,'')
      department = entry.try(:department).to_s.strip.sub(/(\[\")/,'').sub(/(\"\])/,'')
      displayname = entry.try(:displayname).to_s.strip.sub(/(\[\")/,'').sub(/(\"\])/,'')
      company = entry.try(:company).to_s.strip.sub(/(\[\")/,'').sub(/(\"\])/,'')
      l = entry.try(:l).to_s.strip.sub(/(\[\")/,'').sub(/(\"\])/,'')


      if sAMAccountName != ""
        new_user = AddressBookCorp.find_or_initialize_by(login: sAMAccountName)
        # new_user.f_name = sn
        # new_user.i_name = givenName
        new_user.email = email
        new_user.fio = displayname
        new_user.position = title
        new_user.department = department
        new_user.organisation = company
        new_user.address = l
        new_user.save
        @a = entry
      end

    end





  end





end

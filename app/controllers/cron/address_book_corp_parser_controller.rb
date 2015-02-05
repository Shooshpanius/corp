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


    AddressBookCorp.update_all("active = false")

    # filter = Net::LDAP::Filter.eq("mail", @e_from)
    # attrs = ["givenName", "sn", "physicalDeliveryOfficeName", "sam_account_name", "mail", "title", "department"]
    i = 0
    ldap.search(:base => 'OU=WUsers,DC=wood,DC=local',  :return_result => true) do |entry|

      i += i
      # givenName = entry.try(:givenName).to_s.strip.sub(/(\[\")/,'').sub(/(\"\])/,'')
      # sn = entry.try(:sn).to_s.strip.sub(/(\[\")/,'').sub(/(\"\])/,'')
      #username = entry.try(:username).to_s.strip
      sam_account_name = entry.try(:sAMAccountName).to_s.strip.sub(/(\[\")/,'').sub(/(\"\])/,'')
      #office = entry.try(:office).to_s.strip
      email = entry.try(:mail).to_s.strip.sub(/(\[\")/,'').sub(/(\"\])/,'')
      title = entry.try(:title).to_s.strip.sub(/(\[\")/,'').sub(/(\"\])/,'')
      department = entry.try(:department).to_s.strip.sub(/(\[\")/,'').sub(/(\"\])/,'')
      displayname = entry.try(:displayname).to_s.strip.sub(/(\[\")/,'').sub(/(\"\])/,'')
      company = entry.try(:company).to_s.strip.sub(/(\[\")/,'').sub(/(\"\])/,'')
      l = entry.try(:l).to_s.strip.sub(/(\[\")/,'').sub(/(\"\])/,'')
      telephonenumber_str = entry.try(:telephonenumber).to_s.strip.sub(/(\[\")/,'').sub(/(\"\])/,'')
      ipphone_str = entry.try(:ipphone).to_s.strip.sub(/(\[\")/,'').sub(/(\"\])/,'')
      mobile_str = entry.try(:mobile).to_s.strip.sub(/(\[\")/,'').sub(/(\"\])/,'')
      homephone_str = entry.try(:homephone).to_s.strip.sub(/(\[\")/,'').sub(/(\"\])/,'')

      if sam_account_name != ""
        new_user = AddressBookCorp.find_or_initialize_by(login: sam_account_name)
        # new_user.f_name = sn
        # new_user.i_name = givenName
        new_user.email = email
        if email != ''
          new_user.have_email = true
        else
          new_user.have_email = false
        end
        new_user.fio = displayname
        new_user.position = title
        new_user.department = department
        new_user.organisation = company
        new_user.address = l
        new_user.active = true
        new_user.save


        # :homephone=>["111"],
        # :mobile=>["333"],
        # :pager=>["222"]}>
        # :facsimiletelephonenumber=>["444"]
        # :telephonenumber=>["1002"],
        # :ipphone=>["1002"]


        # Корпоративный мобильный
        telephonenumber = telephonenumber_str.gsub(/[^0-9]/, '').to_s
        telephonenumber = telephonenumber[1..telephonenumber_str.length].to_s
        if telephonenumber.length == 10
          num = CorpNumber.where('address_book_corp_id = ? and type_n = ?', new_user.id, 'c')
          if num.length != 0
            CorpNumber.update(
                num,
                number: telephonenumber,
            )
          else
            CorpNumber.create(
                address_book_corp_id: new_user.id,
                number: telephonenumber,
                type_n: "c"
            )
          end
        else
          CorpNumber.where('address_book_corp_id = ? and type_n = ?', new_user.id, 'c').destroy_all
        end


        # Внутренний
        ipphone = ipphone_str.gsub(/[^0-9A-Z]/, '').to_s
        if ipphone.length == 4 or ipphone.length == 9
          num = CorpNumber.where('address_book_corp_id = ? and type_n = ?', new_user.id, 'i')
          if num.length != 0
            CorpNumber.update(
                num,
                number: ipphone[0..3],
            )
          else
            CorpNumber.create(
                address_book_corp_id: new_user.id,
                number: ipphone[0..3],
                type_n: "i"
            )
          end
        else
          CorpNumber.where('address_book_corp_id = ? and type_n = ?', new_user.id, 'i').destroy_all
        end

        if ipphone.length == 9
          num = CorpNumber.where('address_book_corp_id = ? and type_n = ?', new_user.id, 'a')
          if num.length != 0
            CorpNumber.update(
                num,
                number: ipphone[5..8],
            )
          else
            CorpNumber.create(
                address_book_corp_id: new_user.id,
                number: ipphone[5..8],
                type_n: "a"
            )
          end
        else
          CorpNumber.where('address_book_corp_id = ? and type_n = ?', new_user.id, 'a').destroy_all
        end







        # Личный мобильный
        mobile = mobile_str.gsub(/[^0-9]/, '').to_s
        mobile = mobile[1..mobile.length].to_s
        if mobile.length == 10
          num = CorpNumber.where('address_book_corp_id = ? and type_n = ?', new_user.id, 'm')
          if num.length != 0
            CorpNumber.update(
                num,
                number: mobile,
            )
          else
            CorpNumber.create(
                address_book_corp_id: new_user.id,
                number: mobile,
                type_n: "m"
            )
          end
        else
          CorpNumber.where('address_book_corp_id = ? and type_n = ?', new_user.id, 'm').destroy_all
        end

        # Личный мобильный
        homephone = homephone_str.gsub(/[^0-9]/, '').to_s
        homephone = homephone[1..homephone.length].to_s
        if homephone.length == 10
          num = CorpNumber.where('address_book_corp_id = ? and type_n = ?', new_user.id, 'h')
          if num.length != 0
            CorpNumber.update(
                num,
                number: homephone,
            )
          else
            CorpNumber.create(
                address_book_corp_id: new_user.id,
                number: homephone,
                type_n: "h"
            )
          end
        else
          CorpNumber.where('address_book_corp_id = ? and type_n = ?', new_user.id, 'h').destroy_all
        end

        if mobile.length == 10 || telephonenumber.length == 10 || homephone.length == 10 || ipphone.length == 4 || ipphone.length == 9
          new_user.have_phones = true
          new_user.save
        else
          new_user.have_phones = false
          new_user.save
        end



      end

    end

    AddressBookCorp.destroy_all("active = false")



  end





end

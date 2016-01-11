class Inventory::WorkstationController < ApplicationController
  def index

    client = Mysql2::Client.new(:host => "zabbix.velskiyles.ru", :username => "ocs", :password => "Vfrfrf1488", :database => "ocsweb")
    results = client.query("SELECT * FROM bios")



    @form_data = {
        results: results
    }
  end
end

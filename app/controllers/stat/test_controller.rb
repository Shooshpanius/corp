class Stat::TestController < ApplicationController

  def index
    log_str = 'SIP/zebra/01#810375175052946,180,L(1800000)rTt'
    dst_n = log_str.to_s.gsub("+", "810");
    dst_n_l = dst_n.length
    dst = log_str.lastdata.to_s.scan(/\d{#{dst_n_l}/)[0].to_s.gsub("810", "+")


  end

end

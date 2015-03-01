class Stat::CallDirectionController < ApplicationController

  before_filter :is_admin

  def index
  end

  def srv_get_cell_time
    date_from = Date.today.prev_day(7)
    date_to = Date.today.next_day(1)
    @cont = Call.select('calldate, descr, context, sum(duration) as total_duration, sum(billsec) as total_billsec').where('descr = ? and DATE(calldate) >= ? and DATE(calldate) <= ?', 'cell', date_from, date_to).group('context')

    respond_to do |format|
      format.json
    end
  end

  def srv_get_cell_count
    date_from = Date.today.prev_day(7)
    date_to = Date.today.next_day(1)
    @cont = Call.select('calldate, descr, context, sum(duration) as total_duration, sum(billsec) as total_billsec').where('descr = ? and DATE(calldate) >= ? and DATE(calldate) <= ?', 'cell', date_from, date_to).group('context')

    respond_to do |format|
      format.json
    end
  end


  def srv_get_corp_time
    date_from = Date.today.prev_day(7)
    date_to = Date.today.next_day(1)
    @cont = Call.select('calldate, descr, context, sum(duration) as total_duration, sum(billsec) as total_billsec').where('descr = ? and DATE(calldate) >= ? and DATE(calldate) <= ?', 'corp', date_from, date_to).group('context')

    respond_to do |format|
      format.json
    end
  end

  def srv_get_corp_count
    date_from = Date.today.prev_day(7)
    date_to = Date.today.next_day(1)
    @cont = Call.select('calldate, descr, context, sum(duration) as total_duration, sum(billsec) as total_billsec').where('descr = ? and DATE(calldate) >= ? and DATE(calldate) <= ?', 'corp', date_from, date_to).group('context')

    respond_to do |format|
      format.json
    end
  end


  def srv_get_intercity_time
    date_from = Date.today.prev_day(7)
    date_to = Date.today.next_day(1)
    @cont = Call.select('calldate, descr, context, sum(duration) as total_duration, sum(billsec) as total_billsec').where('descr = ? and DATE(calldate) >= ? and DATE(calldate) <= ?', 'intercity', date_from, date_to).group('context')

    respond_to do |format|
      format.json
    end
  end

  def srv_get_intercity_count
    date_from = Date.today.prev_day(7)
    date_to = Date.today.next_day(1)
    @cont = Call.select('calldate, descr, context, sum(duration) as total_duration, sum(billsec) as total_billsec').where('descr = ? and DATE(calldate) >= ? and DATE(calldate) <= ?', 'intercity', date_from, date_to).group('context')

    respond_to do |format|
      format.json
    end
  end


  def srv_get_city_time
    date_from = Date.today.prev_day(7)
    date_to = Date.today.next_day(1)
    @cont = Call.select('calldate, descr, context, sum(duration) as total_duration, sum(billsec) as total_billsec').where('descr = ? and DATE(calldate) >= ? and DATE(calldate) <= ?', 'city', date_from, date_to).group('context')

    respond_to do |format|
      format.json
    end
  end

  def srv_get_city_count
    date_from = Date.today.prev_day(7)
    date_to = Date.today.next_day(1)
    @cont = Call.select('calldate, descr, context, sum(duration) as total_duration, sum(billsec) as total_billsec').where('descr = ? and DATE(calldate) >= ? and DATE(calldate) <= ?', 'city', date_from, date_to).group('context')

    respond_to do |format|
      format.json
    end
  end


  def srv_get_local_time
    date_from = Date.today.prev_day(7)
    date_to = Date.today.next_day(1)
    @cont = Call.select('calldate, descr, context, sum(duration) as total_duration, sum(billsec) as total_billsec').where('descr = ? and DATE(calldate) >= ? and DATE(calldate) <= ?', 'local', date_from, date_to).group('context')

    respond_to do |format|
      format.json
    end
  end

  def srv_get_local_count
    date_from = Date.today.prev_day(7)
    date_to = Date.today.next_day(1)
    @cont = Call.select('calldate, descr, context, sum(duration) as total_duration, sum(billsec) as total_billsec').where('descr = ? and DATE(calldate) >= ? and DATE(calldate) <= ?', 'local', date_from, date_to).group('context')

    respond_to do |format|
      format.json
    end
  end




  private
  def is_admin
    if !session[:is_admin]
      redirect_to "/"
    end
  end

end

class MyBook < ActiveRecord::Base
  belongs_to :user


  def MyBook.get_list(first_letter, user_id)

    if first_letter.to_s.length == 1
      list = MyBook.where('organisation like ? AND ( ( user_id = ? AND shared = 0) OR shared = 1)', first_letter.to_s+'%', user_id).order('organisation ASC')
    elsif first_letter.to_s == 'all' or first_letter.to_s.length == 0
      list = MyBook.where('(user_id = ? AND shared = 0) OR shared = 1', user_id).order('organisation ASC')
    end

    return list

  end

end

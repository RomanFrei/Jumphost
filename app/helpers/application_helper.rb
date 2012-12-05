module ApplicationHelper

  def ufinder(id)
    User.find(id).username
  end
	
end

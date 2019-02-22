module ApplicationHelper
	def check_access_authorization(user)
    unless is_current_user?(user)
      redirect_to root_path
      flash[:danger] = "Accès non-autorisé"
    end
  end
  def is_current_user?(user)
  	current_user == user
  end
  def class_for_flash(type)
  case type
    when 'notice' then "info"
    when 'success' then "success"
    when 'danger' then "danger"
    when 'alert' then "warning"
  end
end
end

module ApplicationHelper
  def is_admin?
   if current_user.role.name == 'admin'
     return true
   else
     return false
   end
  end

  def active?(*paths)
    'active' if paths.any?{ |path| current_page?(path) }
  end
end

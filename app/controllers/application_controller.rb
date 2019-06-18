class ApplicationController < ActionController::Base  
  def after_sign_in_path_for(resource)
    if (current_user.is_admin)
      store_location_for(resource, admin_root_path)
    end
  end
end

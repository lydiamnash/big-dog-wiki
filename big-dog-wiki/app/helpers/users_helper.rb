module UsersHelper

  # Helper methods in Rails are only available to the view, unlike the Sinatra framework

  # Move #current_user to application_controller

  # Move #authorize to a Controller. Best practice? Probably to just move it to Users or Sessions Controller, but I'm moving it to App Controller too.
  ### NB: It shouldn't be here because its only purpose is to redirect -- put it in the controller, the views don't need access to that power!

  # Move #admin? to application_controller
end

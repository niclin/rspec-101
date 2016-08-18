require_relative "../../base"

module PageObjects
  module Devise
    module Sessions
      class New < Base
        def sign_in(email, password)
          fill_form :user, email: email, password: password
          click_button "Log in"
        end
      end
    end
  end
end

Comment Edit

require_relative "../base"

module PageObjects
  module Application
    class Navbar < base
      def sign_in
        click_on "Login"
        PageObjects::Devise::Sessions::New.New
      end

      def sign_out(email)
        user_dropdown(email).click_on "Logout"
      end

      def user_deopdown(email)
        dropdown email
      end

      private

      def dropdown(text)
        find ".navbar .dropdown", text: text
      end

    end
  end
end

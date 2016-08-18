require_relative "../base"

module PageObjects
  module Pages
    class Home < Base
      def go
        visit "/"
        self
      end
    end
  end
end

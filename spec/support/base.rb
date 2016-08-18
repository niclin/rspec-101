module PageObjects
  class Base
    include Capybara::DSL
    include Formulaic::Dsl
    include Rails.application.routes.url_helpers
  end
end

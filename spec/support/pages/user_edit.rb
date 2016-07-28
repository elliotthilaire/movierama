require 'capybara/rspec'

module Pages
  class UserEdit
    include Capybara::DSL

    def open
      visit('/user/edit')
      self
    end

    def submit(email:)
      fill_in 'email', with: email
      click_on 'Update Profile'
      self
    end

    def has_user_updated_message?
      page.has_content?('Profile updated')
    end

    def has_error_message?
      page.has_content?('Errors were detected')
    end
  end
end

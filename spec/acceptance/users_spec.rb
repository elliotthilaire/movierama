require 'rails_helper'
require 'capybara/rails'
require 'support/pages/user_edit'
require 'support/with_user'

RSpec.describe "User ", type: :feature do

  let(:page) { Pages::UserEdit.new }

  with_logged_in_user

  describe "edit user profile" do
    describe 'email' do
      context 'with valid email' do
        it 'updates email' do
          page.open
          page.submit(email: 'tk-421@deathstar.emp')
          expect(page).to have_user_updated_message
        end
      end

      context 'with blank email' do
        it 'updates email' do
          page.open
          page.submit(email: '')
          expect(page).to have_user_updated_message
        end
      end

      context 'with invalid email' do
        it 'displays error' do
          page.open
          page.submit(email: 'not an email address')
          expect(page).to have_error_message
        end
      end
    end
  end
end

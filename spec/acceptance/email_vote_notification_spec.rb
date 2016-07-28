require 'rails_helper'
require 'capybara/rails'
require 'support/pages/movie_list'
require 'support/pages/movie_new'
require 'support/with_user'

RSpec.describe 'email vote notification to user', type: :feature do

  let(:page) { Pages::MovieList.new }

  before do
    author = User.create(
      uid:  'null|12345',
      name: 'Bob'
    )
    Movie.create(
      title:        'Empire strikes back',
      description:  'Who\'s scruffy-looking?',
      date:         '1980-05-21',
      user:         author
    )
  end

  context 'when logged in' do
    with_logged_in_user

    before { page.open }

    context 'when liked' do
      it 'sends an email' do
        expect { page.like('Empire strikes back') }
        .to change { ActionMailer::Base.deliveries.count }.by(1)
      end
    end

    context 'when hated' do
      it 'sends an email' do
        expect { page.hate('Empire strikes back') }
        .to change { ActionMailer::Base.deliveries.count }.by(1)
      end
    end

  end
end




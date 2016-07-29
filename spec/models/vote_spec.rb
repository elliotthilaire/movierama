require 'rails_helper'

RSpec.describe Vote, :type => :model do

  let(:user) {
    User.create(
      uid:  'null|67890',
      name: 'Bob'
    )
  }

  let(:author) {
    User.create(
      uid:  'null|12345',
      name: 'Alice'
    )
  }

  let(:movie) {
    Movie.create(
      title:        'Empire strikes back',
      description:  'Who\'s scruffy-looking?',
      date:         '1980-05-21',
      user:         author,
      liker_count:  50,
      hater_count:  2
    )
  }

  describe "#new" do
    context "when no vote" do
      context "when like" do
        it "is valid" do
          expect {
            Vote.create(vote: :like, movie: movie, user: user)
          }.not_to raise_error
        end
      end

      context "when hate" do
        it "is valid" do
          expect {
            Vote.create(vote: :hate, movie: movie, user: user)
          }.not_to raise_error
        end
      end

      context "when invalid state" do
        it "is invalid" do
          expect {
            Vote.create(vote: :hate, movie: movie, user: user)
            }.to raise_error
        end
      end

    end

    context "when user has already voted" do
      it "does not create a new vote" do
        Vote.create(vote: :like, movie: movie, user: user)
        expect {
          Vote.create(vote: :hate, movie: movie, user: user)
        }.to raise_error
      end
    end
  end
end

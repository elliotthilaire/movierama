class Vote < BaseModel
  include Ohm::Timestamps
  attribute :vote

  reference :user, :User
  index     :user

  reference :movie, :Movie
  index     :movie
end

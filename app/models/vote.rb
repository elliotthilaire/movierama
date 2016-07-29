class Vote < BaseModel
  include Ohm::Timestamps
  attribute :vote

  reference :user, :User
  reference :movie, :Movie
end

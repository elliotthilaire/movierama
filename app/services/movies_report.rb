class MoviesReport
  attr_reader :date

  def initialize(date:, user:)
    @date = date
    @user = user
  end

  def movies
    @user.movies
      .map { |movie| MovieReport.new(movie: movie, date: date) }
  end
end

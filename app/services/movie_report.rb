class MovieReport
  attr_reader :date

  def initialize(date:, movie:)
    @date = date
    @movie = movie
  end

  def movie_title
    @movie.title
  end

  def likes
    7 # query DB for likes today
  end

  def hates
    6
  end
end

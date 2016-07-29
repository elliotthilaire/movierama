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
    Votes.find(movie: movie)
      .select { |vote| vote.vote == :like }
      .select { |vote| vote.created_at.to_date == @date }
      .count
  end

  def hates
    Votes.find(movie: movie)
      .select { |vote| vote.vote == :hate }
      .select { |vote| vote.created_at.to_date == @date }
      .count
  end
end

class VoteNotificationMailer < ActionMailer::Base
  default from: "from@example.com"

  def notification_email(movie)
    @movie = movie
    @author = @movie.user

    mail(to: @author.email, subject: "#{@movie.title} has a new vote!")
  end
end

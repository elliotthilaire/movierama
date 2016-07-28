class VoteNotificationMailer < ActionMailer::Base
  default from: "from@example.com"

  def notification_email(movie)
    @movie = movie
    @user = @movie.user

    @url  = 'http://example.com/login'
    mail(to: 'no_one@email.com', subject: "#{@movie.title} has a new vote!")
  end
end

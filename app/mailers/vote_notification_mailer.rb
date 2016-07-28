class VoteNotificationMailer < ApplicationMailer

  def notification_email(movie)
    @movie = movie
    @author = @movie.user

    mail(to: @author.email, subject: "#{@movie.title} has a new vote!")
  end
end

class MoviesVoteReportMailer < ApplicationMailer

  def email(report:)
    @user = report.user
    @date = report.date
    @movies = report.movies

    mail(to: @user.email, subject: "You have new votes today")
  end
end

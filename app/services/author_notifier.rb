class AuthorNotifier

  def initialize(movie)
    @movie = movie
    @author = movie.user

    _notify_author if _notify_me_enabled
  end

  private

  def _notify_me_enabled
    @author.email.present?
  end

  def _notify_author
    VoteNotificationMailer.notification_email(@movie).deliver
  end
end

class AllMailer < ApplicationMailer
  def sg
    @url = suggestions_url
    mail(to: User.all.find_by_role('admin').email, subject: 'A new suggestions was suggested.')
  end

  def error_email
    @url = errors_url
    mail(to: User.all.find_by_role('admin').email, subject: 'A new error was found by a user.')
  end

  def newreport
    @url = badusers_url
    mail(to: User.all.find_by_role('admin').email, subject: 'A user was reported.')
  end

  def acindent
    @url = acindents_url
    mail(to: User.all.find_by_role('admin').email, subject: "Someone thinks they were banned by acindent")
  end

  def help
    mail(to: User.all.find_by_role("admin").email, subject: "Someone needs help!")
  end
end

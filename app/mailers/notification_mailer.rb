class NotificationMailer < ApplicationMailer

  def notify_delete_agenda
    @agenda = params[:agenda]
    @team = @agenda.team
    mails = @team.members.pluck(:email) << @team.owner.email
    mail to: mails, subject: 'お知らせ'
  end
end

class NotificationMailer < ApplicationMailer

  def notify_delete_agenda
    @agenda = params[:agenda]
    @team = @agenda.team
    mails = @team.members.pluck(:email) << @team.owner.email
    mail to: mails, subject: 'お知らせ'
  end

  def notify_change_owner
    @new_owner = params[:new_owner]
    mail to: @new_owner.email, subject: 'チームリーダ-変更のお知らせ'
  end
end

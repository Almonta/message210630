class ContactMailer < ApplicationMailer
  def contact_mail(picture)
    @picture = picture
    mail to: "tkg.8.mthr@gmail.com", subject: "投稿の確認メール"
  end
end

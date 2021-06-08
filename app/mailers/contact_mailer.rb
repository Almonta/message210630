class ContactMailer < ApplicationMailer
  def contact_mail(picture)
    @picture = picture
    mail to: "tkg.8.mthr@gmail.com", subject: "お問い合わせの確認メール"
  end
end

class UserMailer < ActionMailer::Base
  #default from: "from@example.com"
  def registration_notification(register)
    @register = register
    mail(:to => 'joseluis@vulcanik.com', :subject => 'Registered', :from => 'beta@vulcanik.com')
  end
end

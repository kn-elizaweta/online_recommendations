class PatientMailer < ApplicationMailer
  default from: 'notifications@example.com'

  def new_recommendation_email
    @patient = params[:patient]
    @url  = 'http://example.com/patient_recommendations'
    mail(to: 'kn-elizaweta@yandex.ru', subject: 'You have a new recommendation')
  end
end

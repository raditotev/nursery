class PublicPagesController < ApplicationController
  def home
    @closures = Break.where('start_date > ?', Date.today)
                                   .order(start_date: :asc)
    @newsletters = Newsletter.order(created_at: :desc).last(3)
    @awards = Award.last(3)
    @ofsted_description = "Ofsted is the inspectorate for children and learners in England."
    @foundation_years_description = "Information and support for parents on parenting,  child development, Early education, school and special needs."
    @lambeth_service_description = "The Families Information Service provides free, reliable and impartial information and assistance to parents, children, young people and professionals on support services and activities for the 0 to 19 year olds and up to 25 if the young person has a special need or disability."
  end

  def about_us
  end

  def nursery
  end

  def staff
    @awards = Award.all
  end

  def contact
    if request.post?
      message = {}
      message['from'] = params[:contact][:from]
      message['subject'] = params[:contact][:subject]
      message['content'] = params[:contact][:content]
      PublicMailer.contact_form(message).deliver
      flash[:success] = "Message has been send."
    end
    @new_mail = {from: '', subject: '', message: ''}
  end
end

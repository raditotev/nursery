class PublicPagesController < ApplicationController
  before_action :authenticate_parent!, only: [:gallery, :album, :profile]

  def home
    @testimonials = Testemonial.all
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
      params[:contact].each_pair{ |k, v| message[k] = v }

      if PublicMailer.contact_form(message).deliver
        flash.now[:success] = "Message has been send."
        render :contact
      else
        flash.now[:error] = "Please try again."
        render :contact
      end
    end
  end

  def careers
    @jobs = Job.all
  end

  def testimonials
    @testimonials = Testemonial.all
  end

  def education_fund
  end

  def eyfs_curriculum
  end

  def british_values
  end

  def request_viewing
    request = {}
    params[:request].each_pair { |k, v| request[k] = v}

    if PublicMailer.request_viewing(request).deliver
      respond_to :js
    else
      flash.now[:error] = "Something's wrong. Please try again or send us message via our contact form."
      render :contact
    end
  end

  def save_money
  end

  def faqs
    @faqs = Faq.all
  end

  def gallery
    @albums = Album.all
  end

  def album
    album = Album.find(params[:id])
    @name = album.name
    @photos = album.photos
  end

  def profile

  end
end

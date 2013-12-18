class Participant < ActiveRecord::Base
   include ActiveModel::ForbiddenAttributesProtection




  before_create { generate_token(:authenticity_token) }

  validates :email, :presence => true, :uniqueness => true
  validates :password, :presence => true,
                       :length => { in: 6..20, message: "- must be between 6 and 20 characters"}
  has_secure_password

  belongs_to :coordinator

## This can be replaced with a participants_feeling most_recent method.  -clm
  belongs_to :feeling
  has_one :trial, through: :coordinator
  has_many :questions
  has_many :participants_feelings
  has_many :feelings, :through => :participants_feelings

  def send_initial_email(password)
  	UserMailer.welcome_email(self, password).deliver
  end

  def generate_password
    password = SecureRandom.hex(n=4)
    self.update_attribute(:password, password)
    self.send_initial_email(password)
    password
  end

  def send_question_answered_email
    UserMailer.notify_participant_question_answered(self).deliver
  end

## Is the (column) parameter necessary? Checkout the Hartl tutorial;
## http://ruby.railstutorial.org/chapters/sign-in-sign-out?version=3.2#sec-remember_me  -clm
  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while Participant.exists?(column => self[column])
  end

## This method can be replaced with one liner;
## Participant.find_by_subject_number(subject_number)
## +Else+ block is never triggered. The actual validation logic
## lives in the Coordinator Controller. -clm
  def self.search(search)
    if search
      find(:all, :conditions => ['subject_number = ?', search])
    else
      flash[:message] = "Subject does not exist"
      redirect_to root_path
    end
  end

  def pending_questions

## Question.joins(:answer).where(participant_id: self.id).count  or this
## self.questions.where(answered: false).count -clm
    n = 0
    self.questions.each do |question|
      n +=1 if question.answer.nil?
    end
    n
  end

## This method produces all unviewed answers regardless of whether they are a
## particular participants.
## Answer.joins(:question).where("answers.viewed = false AND questions.participant_id = ?", current_user.id)  -clm
  def answers_unviewed
    Answer.joins(:question).where(viewed: false).readonly(false)
  end

  private

  def participant_params
    params.require(:participant).permit!

## Is this redundant?
    params.require(:participant).permit(:password)
  end


end
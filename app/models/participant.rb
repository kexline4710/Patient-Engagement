class Participant < ActiveRecord::Base


  attr_accessible :email, :first_name, :last_name, :password, :authenticity_token, :password_confirmation, :first_time_login, :subject_number, :feeling_id, :feelings


  before_create { generate_token(:authenticity_token) }

  validates :email, :presence => true, :uniqueness => true
  validates :password, :presence => true,
                       :length => { in: 6..20, message: "- must be between 6 and 20 characters"}
  has_secure_password

  belongs_to :coordinator
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

  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while Participant.exists?(column => self[column])
  end


  def self.search(search)
    if search
      find(:all, :conditions => ['subject_number = ?', search])
    else
      flash[:message] = "Subject does not exist"
      redirect_to root_path
    end
  end


  def pending_questions
    n = 0
    self.questions.each do |question|
      n +=1 if question.answer.nil?
    end
    n
  end

  def answers_unviewed
    Answer.joins(:question).where(viewed: false).readonly(false)
  end
end
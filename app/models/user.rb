class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :timeoutable
  before_save :validates_role
  
  belongs_to :role
  has_many :service_requests
  validates_presence_of :first_name, :last_name
  
  # EVERY user must have at least one role, if no role is assigned, then automatically assign the lowest role available (Attendant = 5).
  def validates_role
    self.role = Role.find_by_name "Technician" if self.role.nil?
  end
  
  def is_superuser?
    self.role ? self.role.name.downcase == "superuser" : false
  end
  
  def is_manager?
    self.role ? self.role.name.downcase == "management" : false
  end
  
  def is_manager_assistant?
    self.role ? self.role.name.downcase == "management assistant" : false
  end
  
  def is_supervisor?
    self.role ? self.role.name.downcase == "supervisor" : false
  end
  
  def is_technician?
    self.role ? self.role.name.downcase == "technician" : false
  end
  
  def timeout_in  
    if self.is_superuser?
      5.minutes
    elsif self.is_manager?
      120.minutes
    else
      240.minutes
    end
  end
end

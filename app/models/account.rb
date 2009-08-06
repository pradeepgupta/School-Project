# == Schema Information
#
# Table name: accounts
#
#  id                   :integer         not null, primary key
#  login                :string(255)
#  email                :string(255)
#  crypted_password     :string(255)
#  password_salt        :string(255)
#  persistence_token    :string(255)     not null
#  perishable_token     :string(255)     not null
#  confirmed_at         :datetime
#  confirmation_sent_at :datetime
#  login_count          :integer         default(0), not null
#  failed_login_count   :integer         default(0), not null
#  last_request_at      :datetime
#  current_login_at     :datetime
#  last_login_at        :datetime
#  current_login_ip     :string(255)
#  last_login_ip        :string(255)
#

class Account < ActiveRecord::Base
  
  acts_as_authentic do |c|
    c.perishable_token_valid_for 5.days
    
    # Use this if you have your accountable polymorphic association
    # a.validations_scope = :accountable_type
    
    # Disable require password confirmation and AuthHelpers handle it, since it
    # adds email and password confirmation without validates length of password
    # check.
    c.require_password_confirmation = false
    
    # Login/Username is optional, not required for account signup.
    c.validate_login_field = false
    
    # E-mail validations.
    c.validates_length_of_email_field_options = {
        :within => 5..100,
        :allow_blank => true
      }
    c.merge_validates_format_of_email_field_options :allow_blank => true
    
     # Password validations.
    c.validates_length_of_password_field_options = {
        :within => 6..20,
        :allow_blank => true,
        :if => :require_password?
      }
  end
  
  # Un-protect login field.
  attr_accessible :login
  
  # Add presence validations since we added allow blank to validates length of
  validates_presence_of   :email
  validates_presence_of   :password, :on => :create
  validates_uniqueness_of :login, :on => :update,
    :case_sensitive => false,
    :allow_blank => true
    
  # default_values  :name => "foo"
  
  # Login using either username/login, or e-mail.
  def self.find_by_username_or_email(login)
    find_by_login(login) || find_by_email(login)
  end
  
  include AuthHelpers::Model::Confirmable
  include AuthHelpers::Model::Recoverable
  include AuthHelpers::Model::Updatable
  
end

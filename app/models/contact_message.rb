class ContactMessage < SimpleForm
  sender { |sender| %{"#{sender.name}" <#{sender.email}>}}
  subject "Contact Message "
  
  recipients Settings.site.email.contact_form
  
  attribute :message,     :validate => true
  attribute :issue_type,  :validate => false
  attribute :email,       :validate => Authlogic::Regex.email
  attribute :name,        :validate => false
  attribute :nickname,    :captcha  => true
  
  def self.issue_types
    [
      ['Question', :question],
      ['Problem', :problem],
      ['Suggestion', :suggestion],
      ['Other', :other]
    ]
  end
end

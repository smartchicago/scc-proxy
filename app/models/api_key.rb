class ApiKey < ActiveRecord::Base
  before_create :generate_access_token

  validates_presence_of :name

private
  def generate_access_token
    self.access_token = SecureRandom.hex
  end
end

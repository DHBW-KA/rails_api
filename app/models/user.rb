class User < ApplicationRecord
  before_create :generate_api_key

  def generate_api_key
    loop do
      self.api_key = SecureRandom.base64.tr('+/=', 'Qrt')
      break unless User.exists?(api_key: api_key)
    end
  end

end

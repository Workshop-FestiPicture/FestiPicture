class User < ActiveRecord::Base
  attr_accessor :password
  attr_accessible :name, :password

  validates :name,  :presence => true,
                    :length   => { :maximum => 50 }

  validates :password, :presence     => true,
                       	:length       => { :within => 6..40 }

  before_save :encrypt_password

  has_many :pictures, dependent: :destroy

  def has_password?(password_soumis)
    hashed_password == encrypt(password_soumis)
  end
  
  private

    def encrypt_password
      self.salt = make_salt if new_record?
      self.hashed_password = encrypt(password)
    end

    def encrypt(string)
      secure_hash("#{salt}--#{string}")
    end

    def make_salt
      secure_hash("#{Time.now.utc}--#{password}")
    end

    def secure_hash(string)
      Digest::SHA2.hexdigest(string)
    end
end

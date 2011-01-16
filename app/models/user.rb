class User < ActiveRecord::Base


    has_many :user_tippgemeinschafts
    has_many :tippgemeinschafts, :through => :user_tippgemeinschafts


    attr_accessor :password

    attr_accessible :name, :password, :password_confirmation

    validates :password, :confirmation => true
    validates :name,  :presence => true,
                      :length   => { :maximum => 50 }


    before_save :encrypt_password

  
  
    def has_password?(submitted_password)
        encrypted_password == encrypt(submitted_password)
    end

    def self.authenticate(name, submitted_password)
        user = find_by_name(name)
        return nil  if user.nil?
        return user if user.has_password?(submitted_password)
    end

 
    def self.authenticate_with_salt(id, cookie_salt)
        user = find_by_id(id)
        return nil  if user.nil?
        return user if user.salt == cookie_salt
    end





#/***********************************************************************************************
# * PRIVATE METHODES
# ***********************************************************************************************/
 
    private

    def encrypt_password
        self.salt = make_salt if new_record?
        self.encrypted_password = encrypt(password)
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

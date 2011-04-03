class User < ActiveRecord::Base


    has_many :user_tippgemeinschafts
    has_many :tippgemeinschafts, :through => :user_tippgemeinschafts


    attr_accessor :password
    attr_accessible :name, :email, :password, :password_confirmation

		
    validates :password, :confirmation => true
    validates :name,   :presence => true, :length => { :maximum => 50 }
	validates :email,  :presence => true


    before_save :encrypt_password

  
  
    def has_password?(submitted_password)
        encrypted_password == encrypt(submitted_password)
    end

    def self.authenticate(name, submitted_password)
        user = find_by_name(name)
        return nil  if user.nil?
        return 1 	if !user.active								###FIXME!
        return user if user.has_password?(submitted_password)
        
    end

 
    def self.authenticate_with_salt(id, cookie_salt)
        user = find_by_id(id)
        return nil  if user.nil?
        return user if user.salt == cookie_salt
    end



	def self.search(search)
	  if search
	    where('name LIKE ?', "%#{search}%")
	  else
	    scoped
	  end
	end
	
	
	 def encrypt_new_password( password )
        self.encrypted_password = encrypt(password)		#Encrypt just the first time
        self.save
    end    
  




#/***********************************************************************************************
# * PRIVATE METHODES
# ***********************************************************************************************/
 
    private

    def encrypt_password
        self.salt = make_salt if new_record?
        self.encrypted_password = encrypt(password) if !self.active		#Encrypt just the first time
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

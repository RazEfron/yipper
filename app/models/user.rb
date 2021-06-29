# == Schema Information
#
# Table name: users
#
#  id                    :bigint           not null, primary key
#  username              :string           not null
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#  age                   :integer
#  political_affiliation :string
#  email                 :string
#  password_digest       :string           not null
#  session_token         :string           not null
#
# Rails automatically makes getter/setter methods for each col in our db

class User < ApplicationRecord
    validates :username, :session_token, presence: true, uniqueness: true
    # validates :password_digest, presence: true
    # validates :password, length: { minimum: 6, allow_nil: true } #allow_nil allows us to "skip" this validation for login 
    # validates :age, :email, presence: true

    # here we're adding Rails callback methods
    after_initialize :ensure_session_token # invoked when .new is called
    # before_validation :ensure_session_token # invoked when .save is called 

    def self.find_by_credentials(username, password)
        user = User.find_by(username: username)
        if user && user.is_password?(password) # if user is in the db, and the password is the correct password for the user object
            user # return the user that we found
        else
            nil # return nil if user is not found or if the password is wrong
        end
    end

    def is_password?(password)
        password_object = BCrypt::Password.new(self.password_digest)
        # BCrypt::Password.new creates a new Password object with self.password_digest, which means we can use built-in BCrypt methods on it
        password_object.is_password?(password) # this method is BCrypt::Password.is_password?, NOT User.is_password?
        # BCrypt::Password.is_password? takes the plain-text password and checks if it's the same as password_object
    end

    def password
        @password 
    end

    def password=(password)
        self.password_digest = BCrypt::Password.create(password)
        # BCrypt::Password.create hashes the 'password' and stores it into our password_digest col in our db
        # BCrypt module > Password model > create method > takes in the password we pass in as an argument => sets the result to 'self.password_digest'
        # MUST capitalize B AND C in 'BCrypt'!!
        # also comment in 'bcrypt' gem in Gemfile!!
        @password = password 
    end

    def ensure_session_token
        self.session_token ||= SecureRandom::urlsafe_base64
    end
    # when making a new User, we pass along info for each col, and when Rails runs any validation, it needs to get the col and it's respective data

    def reset_session_token!
        self.session_token = SecureRandom::urlsafe_base64 # setting User.session_token to a new token
        self.save! # make sure that the session_token is saved to our db!!
        self.session_token # return the session_token
    end








    #you can name associations whatever you'd like, but 
    #best to be semantic. Here: "author" (User model) 
    #has many "yips" (Yip model)

    #primary_key == owner (the User "has many" yips)
    #foreign_key == owned element (Yip "belongs to" author)




    has_many :yips,
        primary_key: :id,
        foreign_key: :author_id,
        class_name: :Yip


    #has_many associations don't have built-in validations

    has_many :likes,
        class_name: :Like,
        primary_key: :id,
        foreign_key: :liker_id

    #through associations use other associations that we've already built
    has_many :liked_yips,
        #through must be an association from this model
        through: :likes, #points to association on line 25 (has_many :likes)
        #source is from the connected model
        source: :yip #points to belongs_to :yip (line 19 in Like model)

    # PT 1

    # #Get first user record, use first
    # User.first 

    # #Get last user record, use last
    # User.last

    # #Find a user that exists by id, use find
    # User.find(11)

    # #Find a user that doesn't exist by id, use find
    # User.find(20)
    # # User.find(-20) we'll never have a negative id number

    # #Find a user by username, use find_by
    # User.find_by(username: "squirelly")
    
    # #Find a user by username that does not exist, use find_by
    # User.find_by(username: "monkey_bones")

    # find and find_by throw different errors
        # find will return an ActiveRecord::RecordNotFound error
        # find_by will return nil

















    # PT 2
    
    # #Find all users between the ages of 10 and 20 inclusive. Show their username, and political affiliation.
    # User.where(age: 10..30).select(:username, :political_affiliation)


    # #Find all users not younger than the age of 11. Use `where.not`
    # User.where.not(age: 0..10)

    # #Find all political_affiliations of our users
    # User.select(:political_affiliation).group(:political_affiliation)
    # # User.select(:political_affiliation).distinct

    # #Find all users who has a political affiliation in this list and order by ascending
    # political_affiliations = ["Ruby", "C++"]
    # User.where(political_affiliation: political_affiliations).order(username: :asc)


end

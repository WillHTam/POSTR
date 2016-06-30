class User < ActiveRecord::Base
    has_many :posts

    acts_as_follower
    acts_as_followable
    acts_as_liker
    acts_as_likeable
    acts_as_mentionable

    has_secure_password

    validates :name, presence: true, uniqueness: true

    validates :email, presence: true, uniqueness: true

    validates_format_of :email, :with => /@/

    validates :password, presence: true, length: {minimum: 8}
end

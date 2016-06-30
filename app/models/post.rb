class Post < ActiveRecord::Base

  acts_as_likeable
  acts_as_votable

  has_many :comments, dependent: :destroy
  belongs_to :user
  validates :title, presence: true
  validates :body, presence: true

  #paperclip
  has_attached_file :media, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :media, content_type: /\Aimage\/.*\Z/
  validates_attachment_file_name :media, matches: [/png\Z/, /jpe?g\Z/]
  do_not_validate_attachment_file_type :media

end

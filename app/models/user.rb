class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy

  has_many :liked_posts,
    through: :likes, source: :likable, source_type: "Post"
  has_many :liked_comments,
    through: :likes, source: :likable, source_type: "Comment"

  validates :username, presence: true

  def like!(likable)
    likes << Like.new(likable:)
  end

  def liked?(likable)
    likes.find_by(likable:).present?
  end
end

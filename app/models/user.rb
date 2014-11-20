class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :auth_tokens

  after_create :set_canvas_api_token


  def auth_token
    auth_tokens.last.token
  end


  private

  def set_canvas_api_token
    auth_tokens.create(token: CanvasAPI::Request.auth_token, active: true)
  end
end

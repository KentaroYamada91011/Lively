class Artist < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # devise :database_authenticatable, :registerable,
  #        :recoverable, :rememberable, :validatable
  devise :database_authenticatable, :registerable,
       :recoverable, :rememberable, :trackable, :validatable
  has_many :follows
  # validates :name, presence: true
  mount_uploader :image, ImageUploader

  def self.find_for_oauth2(auth)
    artist = Artist.where(uid: auth.uid, provider: auth.provider).first

    unless artist
      artist = Artist.create(
        uid:      auth.uid,
        provider: auth.provider,
        email:    Artist.dummy_email(auth),
        password: Devise.friendly_token[0, 20],
        name:     auth.info.name,
        image:    auth.info.image
      )
    end
    return artist
  end

  def sign_in_and_redirect(resource_or_scope, *args)
    options  = args.extract_options!
    scope    = Devise::Mapping.find_scope!(resource_or_scope)
    resource = args.last || resource_or_scope
    sign_in(scope, resource, options)
    redirect_to after_sign_in_path_for(resource)
  end

  private

  def self.dummy_email(auth)
    "#{auth.uid}-#{auth.provider}@example.com"
  end


end

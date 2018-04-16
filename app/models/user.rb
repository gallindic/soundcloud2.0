class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, omniauth_providers: %i[facebook]

         
  #dependent - če je starš izbrisan iz baze bodo še otroci
  has_many :musics, dependent: :destroy #Ima nič ali več komentarjev (otrok)
  has_many :comments, dependent: :destroy #Ima nič ali več komentarjev (otrok)
  
  #Potrebno za carrierwave gem (dodajanje datotek)
  mount_uploader :image, FileUploader
  
  #Potrebno za acts_as_votable gem
  #Pove, da je model user tisti, ki glasuje (dodaja glasove)
  acts_as_voter  #Ni več v uporabi
  
  def self.from_omniauth(auth)
  where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
    user.email = auth.info.email
    user.password = Devise.friendly_token[0,20]
    user.name = auth.info.name   # assuming the user model has a name
    user.image = auth.info.image # assuming the user model has an image
    # If you are using confirmable and the provider(s) you use validate emails, 
    # uncomment the line below to skip the confirmation emails.
    # user.skip_confirmation!
  end
end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end


end

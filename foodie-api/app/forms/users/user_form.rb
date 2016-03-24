class UserForm < Reform::Form


	properties :name, :email, :password, :password_confirmation
  property :auth_token, :readable => false


	validates :name, :email, :presence => true
  validates :password,
    :presence => true,
    :length => {:in => 8..72}
	validates_uniqueness_of :email

  validate :password_confirmed


	def save
    self.auth_token = AuthTokenGenerator.new.generate

		super
	end





  protected

  def password_confirmed
    return if self.password == self.password_confirmation

    self.errors.add :password_confirmation, 'does not match'
  end

end

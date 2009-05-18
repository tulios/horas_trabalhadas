class User < ActiveRecord::Base
	has_many :project_memberships, :conditions => "leaved is null"
	has_many :time_logs
	has_many :projects, :through => :project_memberships
	
	validates_presence_of :login, :password, :name, :email
	validates_length_of :login, :in => 5..10
	validates_length_of :password, :in => 6..18
	validates_format_of :email, :with => /^([0-9a-zA-Z]([-.\w]*[0-9a-zA-Z])*@([0-9a-zA-Z][-\w]*[0-9a-zA-Z]\.)+[a-zA-Z]{2,9})$/
	validates_uniqueness_of :login, :email
	
	def self.logon(username, password)
		user = User.first :conditions => ["login = ? and password = ?", username, password]
		user
	end
end

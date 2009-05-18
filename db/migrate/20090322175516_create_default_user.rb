class CreateDefaultUser < ActiveRecord::Migration
  def self.up
    User.create :login => "teste", :password => "teste", :name => "Teste User",
                :email => "teste@gmail.com"
  end

  def self.down
    User.first(:conditions => {:login => "teste"}).destroy
  end
end

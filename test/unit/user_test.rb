require 'test_helper'
require 'user'

class UserTest < ActiveSupport::TestCase

  test "required" do
    
    user = User.new
    user.save

    #Verifica se ocorreu erro nos campos abaixo, pois eles são obrigatórios
    assert user.errors[:name]
    assert user.errors[:login]
    assert user.errors[:password]
    assert user.errors[:email]
  end

  test "length" do
    #login e password muito pequenos
    user = User.new(:login => "a", :password => "a", :email => "teste@email.com", :name => "José das costelas")

    #não pode conseguir salvar (!)
    assert !user.save

    #verifica se ocorreu o erro dos campos muito pequenos
    assert user.errors[:login]
    assert user.errors[:password]

    #usando login e password muito grandes
    user.login = "a" * 1000
    user.password = "a" * 1000

    assert !user.save
    assert user.errors[:login]
    assert user.errors[:password]

    #login e password corretos
    user.login = "login"
    user.password = "password"

    assert user.save

    #não deve ter ocorrido nenhum erro nos campos
    assert !user.errors[:login]
    assert !user.errors[:password]
  end

  test "formato de email" do
    user = User.new(:login    => "login",
                    :password => "password",
                    :email    => "errado",
                    :name     => "José das costelas")

    #não pode salvar com o email errado!
    assert !user.save
    assert user.errors[:email]

    #sem o .alguma_coisa
    user.email = "email@email"
    assert !user.save
    assert user.errors[:email]

    #correto
    user.email = "user@email.com"
    assert user.save
    assert !user.errors[:email]
  end

  test "uniqueness" do

    #esse usuário já foi declarado no users.yml
    user = User.new(:login    => "user-1",
                    :password => "password",
                    :email    => "user1@email.com",
                    :name     => "José das costelas")

    #não salva por que login e email devem ser únicos
    assert !user.save
    assert user.errors[:login]
    assert user.errors[:email]

    user.login = "2user-1"
    user.email = "2user1@email1.com"

    assert user.save
    assert !user.errors[:login]
    assert !user.errors[:email]
    
  end

  test "login" do
    assert !User.logon("asda", "asda"),
                  "Um login com usuário e senha iválidos não deve funcionar!"

    assert !User.logon("user-1", "asda"),
                  "Um login com usário válido e senha inválida não deve funcionar!"    

    assert User.logon("user-1", "123123"),
                  "Um login com usuário e senha válidos deve funcionar!"

    
  end

end



































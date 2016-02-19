require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(name: "freddy", password: "abcabc", password_confirmation: "abcabc")
  end

  test "Basic username creation test" do 

    assert @user.valid?

  end 

  test "Username must be non blank" do 
  
    @user.name = ""
    assert_not @user.valid?

  end 

  test "password confirmation must be fixed" do 
  
    @user.password_confirmation = "cbacba"
    assert_not @user.valid?

  end 

  test "no two users can have the same usernames" do

    duplicate_user = @user.dup
    @user.save
    assert_not duplicate_user.valid? 

  end

  test "Passwords must be at least 6 characters long" do

    @user.password = "fooba"
    @user.password_confirmation = "fooba"

    assert_not @user.valid?

  end

end

require "test_helper"

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test 'should not save when the user is blank' do
    assert_equal User.new.save, false
  end

  test 'should save if the user is full' do
    # getting user from my users fixture file (users.yml)
    # 'users' match the name of the file and carlos references
    # the 'carlos' user inside of that same file.
    @user = users(:carlos)

    assert_equal @user.save, true
  end

  test 'should save and subscribe' do
    @user = users(:carlos)

    assert_equal @user.save_and_subscribe, true
  end

  test 'should not save and subscribe with invalid plan' do
    @user = users(:carlos)
    @user.subscription_plan = 'fakeplan'

    assert_equal @user.save_and_subscribe, false
  end
end

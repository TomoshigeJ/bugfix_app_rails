require "application_system_test_case"

class UsersTest < ApplicationSystemTestCase
  # switch to display Browser
  # driven_by :selenium, using: :headless_chrome
  driven_by :selenium, using: :chrome

  def setup
    @user = User.create(email: "user@example.com", password: "foobar", password_confirmation: "foobar")
  end

  test "signup failed with invalid user without email" do
    visit signup_url
    fill_in "Email", with: nil
    fill_in "Password", with: "foobar"
    fill_in "Confirmation", with: "foobar"
    click_button "Sign up"
    assert_no_text "Signup success!"
    assert_text "The form contains 1 error."
    assert_text "Email can't be blank"
  end

  test "login success with exist user" do
    visit login_url
    fill_in "Email", with: "user@example.com"
    fill_in "Password", with: "foobar"
    click_button "Log in"
    assert_text "user@example.com"
   end

  test "login failed with not exist user" do
    visit login_url
    fill_in "Email", with: "other_user@example.com"
    fill_in "Password", with: "foobar"
    click_button "Log in"
    assert_no_text "other_user@example.com"
  end

  test "signup success with valid user" do
    visit signup_url
    fill_in "Email", with: "another_user@example.com"
    fill_in "Password", with: "foobar"
    fill_in "Confirmation", with: "foobar"
    click_button "Sign up"
    assert_text "Signup success!"
    assert_equal User.last.email, "another_user@example.com"
  end

  test "success to visit help page" do
    visit top_pages_help_url
    assert_text "TopPages#help"
  end

  test "logout success" do
    login
    click_on "user@example.com"
    click_on "Log out"
    assert_text "Log in"
  end

  private

  def login
    visit login_url
    fill_in "Email", with: "user@example.com"
    fill_in "Password", with: "foobar"
    click_button "Log in"
  end
end

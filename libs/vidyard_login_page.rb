require_relative '../spec/spec_helper.rb'

class LoginPage
  LOGIN_ERROR_MESSAGE = 'Invalid email or password'
  PASSWORD_RESET_MESSAGE = 'Your Password has been reset - check your email'
  TITLE = 'Vidyard - Login'

  def initialize(driver, base_url)
    # We are passing along the driver here to help with session management in the tests. This
    # lets us ensure that the elements being called are specific to this driver and no other.
    # Helps with concurrency.
    #
    # Taking in the base_url lets us have this page object be generic from staging to production.
    # Elements should be the same, only the base URL is changing.
    @active_driver = driver
    @base_url = base_url

  end

#properties

  def login_error_message
    LOGIN_ERROR_MESSAGE
  end

  def password_reset_message
    PASSWORD_RESET_MESSAGE
  end

  def title
    TITLE
  end

  def url
    @base_url + 'user/sign_in'
  end

#locators
  def login_email_field
    @active_driver.find_element(:id, 'user_email')
  end

  def login_password_field
    @active_driver.find_element(:id, 'user_password')
  end

  def login_button
    @active_driver.find_element(:name, 'commit')
  end

  def login_message_block
    @active_driver.find_element(:css, 'div.alert')
  end

#functions
  def open_web_page
    @active_driver.get(url)
  end

  def log_into_vidyard! (username, password)
    # Takes the user's email and password, walks through the standard login path, and returns the Dashboard screen
    # Assumes a valid credential set; error checking and handling can be added later.

    @active_driver.get(url)

    VidyardBanner.new(@active_driver).log_out_of_vidyard if is_already_logged_in?

    login_email_field.send_keys username
    login_password_field.send_keys password
    login_button.click

    return VidyardDashboardPage
  end

  def is_already_logged_in?
    begin
      !login_email_field.displayed?
    rescue
      return true
    end
  end
end




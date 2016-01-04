require_relative '../spec/spec_helper.rb'

class EloquaLoginPage
  def initialize(driver, url)
    # We are passing along the driver here to help with session management in the tests. This
    # lets us ensure that the elements being called are specific to this driver and no other.
    # Helps with concurrency.
    #
    # Taking in the url lets us have this page object be generic for potential staging vs production changes
    # in Eloqua itself.
    @active_driver = driver
    @url = url
  end

#Properties
  def url
    @url + '/'
  end

#locators

  def eloqua_company_name
    @active_driver.find_element(:id, 'sitename')
  end

  def eloqua_username
    @active_driver.find_element(:id, 'username')
  end

  def eloqua_password
    @active_driver.find_element(:id, 'password')
  end

  def login_button
    @active_driver.find_element(:id, 'submitButton')
  end

#functions
  def open_web_page
    @active_driver.get(url)
  end

  def log_into_eloqua (company, username, password)
    # Takes the user's company name, email and password, walks through the standard login path
    # Assumes a valid credential set; error checking and handling can be added later.

    wait.until {eloqua_username.displayed?}
    eloqua_company_name.send_keys company
    eloqua_username.send_keys username
    eloqua_password.send_keys password
    login_button.click

  end

  def is_already_logged_in?
    begin
      !eloqua_username.displayed?
    rescue
      return true
    end
  end
end

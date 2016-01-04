require_relative '../spec/spec_helper.rb'

class SalesforceLoginPage
  def initialize(driver, url)
    # We are passing along the driver here to help with session management in the tests. This
    # lets us ensure that the elements being called are specific to this driver and no other.
    # Helps with concurrency.
    #
    # Taking in the url lets us have this page object be generic for potential staging vs production changes
    # in Salesforce itself.
    @active_driver = driver
    @url = url
  end

#Properties
  def url
    @url + '/'
  end

#locators

  def salesforce_username
    @active_driver.find_element(:id, 'username')
  end

  def salesforce_password
    @active_driver.find_element(:id, 'password')
  end

  def login_button
    @active_driver.find_element(:id, 'Login')
  end

#functions
  def open_web_page
    @active_driver.get(url)
  end

  def log_into_salesforce (username, password)
    # Takes the user's email and password, walks through the standard login path, and returns the Dashboard screen
    # Assumes a valid credential set; error checking and handling can be added later.

    @active_driver.get(url)

    SalesforceBanner.new(@active_driver).log_out_of_salesforce if is_already_logged_in?

    wait.until {salesforce_username.displayed?}
    salesforce_username.send_keys username
    salesforce_password.send_keys password
    login_button.click

  end

  def is_already_logged_in?
    begin
      !salesforce_username.displayed?
    rescue
      return true
    end
  end
end

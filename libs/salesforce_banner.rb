
class SalesforceBanner
  def initialize(driver)
    # We are passing along the driver here to help with session management in the tests. This
    # lets us ensure that the elements being called are specific to this driver and no other.
    # Helps with concurrency.
    @active_driver = driver
  end

#properties

#locators
  def user_nav_button
    @active_driver.find_element(:id, 'userNavLabel')
  end

  def logout_link
    @active_driver.find_element(:css, 'a.menuButtonMenuLink')
  end

  def leads_link
    @active_driver.find_element(:link, 'Leads')
  end

#functions
  def log_out_of_salesforce #currently takes the user to a You Are Now Logged Out splash screen. If used to reset a test, will need to be followed by a reacquisition of the login page
    user_nav_button.click
    wait.until {logout_link.displayed?}
    logout_link.click
  end

end

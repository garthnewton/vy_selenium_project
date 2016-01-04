
class EloquaBanner
  def initialize(driver)
    # We are passing along the driver here to help with session management in the tests. This
    # lets us ensure that the elements being called are specific to this driver and no other.
    # Helps with concurrency.
    @active_driver = driver
  end

#properties

#locators
  def sign_out_of_eloqua_button
    @active_driver.find_element(:class, 'sc-view logout')
  end

  def open_contacts_menu
    @active_driver.find_element(:id, 'navigation-list-item-contacts')
  end

  def select_contacts_from_menu
    @active_driver.find_element(:id, 'navigation-list-item-contacts-contacts')
  end


#functions
  def log_out_of_eloqua #currently takes the user to a You Are Now Logged Out splash screen. If used to reset a test, will need to be followed by a reacquisition of the login page
    sign_out_of_eloqua_button.click
  end

  def navigate_to_contacts_page
    open_contacts_menu.click
    select_contacts_from_menu.click
  end
end

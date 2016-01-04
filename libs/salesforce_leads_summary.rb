
class SalesforceLeadsSummary
  def initialize(driver)
    # We are passing along the driver here to help with session management in the tests. This
    # lets us ensure that the elements being called are specific to this driver and no other.
    # Helps with concurrency.
    @active_driver = driver
  end

#properties

#locators

#functions
  def open_specific_lead (email)
    @active_driver.find_element(:link, email)
  end

end

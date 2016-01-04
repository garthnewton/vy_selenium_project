
class EloquaContactsPage
  def initialize(driver)
    # We are passing along the driver here to help with session management in the tests. This
    # lets us ensure that the elements being called are specific to this driver and no other.
    # Helps with concurrency.
    @active_driver = driver
  end

#properties

#locators
  def search
    @active_driver.find_element(:class, 'field')
  end

  def contact_overview
    @active_driver.find_element(:id, 'contact-overview-status-label')
  end

  def search_result
    # returns the first entry found. Will fail if no results are found currently
    @active_driver.find_element(:class, 'text')
  end

#functions
  def search_for_contact!(search_term)
    search.clear
    wait
    search.send_keys(search_term)

    # Need some form of a delay for the search to happen; this works if there is a wait.until, however the 'label.text' part isn't right
    # Also need to work out how to find the specific text on screen. The Selenium plugin... can't.

    # wait.until {contact_overview.displayed?}
    # puts contact_overview.text



    wait.until {search_result.displayed?}
    puts search_result.text
    @active_driver.action.double_click(search_result).perform

  end

end

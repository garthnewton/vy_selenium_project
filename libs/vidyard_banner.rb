require_relative '../spec/spec_helper.rb'

class VidyardBanner
  def initialize(driver)
    # We are passing along the driver here to help with session management in the tests. This
    # lets us ensure that the elements being called are specific to this driver and no other.
    # Helps with concurrency.
    @active_driver = driver
  end

#properties

#locators
  def dashboard_link
    @active_driver.find_element(:link, 'Dashboard')
  end

  def analytics_drop_down_menu
    @active_driver.find_element(:link, 'Analytics')
  end

  def analytics_link
    @active_driver.find_element(:link, 'Analytics Center')
  end

  def account_drop_down_menu
    @active_driver.find_element(:link, 'Account')
    #@active_driver.find_element(:id, "nav_account")
  end

  def groups_and_user_menu
    @active_driver.find_element(:link, 'Groups and Users')
  end

  def user_drop_down_menu
    @active_driver.find_element(:css, 'a.dropdown-toggle>img.gravatar')
  end

  def logout_menu_item
    @active_driver.find_element(:link, 'Logout')
  end

#functions
  def log_out_of_vidyard
    wait.until {user_drop_down_menu.displayed?}
    user_drop_down_menu.click
    wait.until {logout_menu_item.displayed?}
    logout_menu_item.click
    sleep(1)
  end

  def return_to_dashboard
    wait.until {dashboard_link.displayed?}
    dashboard_link.click
  end
end

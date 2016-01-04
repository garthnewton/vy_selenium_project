require_relative '../spec/spec_helper.rb'
class GroupsAndUsersPage
  def initialize(driver, base_url)
    # We are passing along the driver here to help with session management in the tests. This
    # lets us ensure that the elements being called are specific to this driver and no other.
    # Helps with concurrency.
    @active_driver = driver
    @groups_and_users_url = base_url + 'organizations' #no longer accurate -- now is base+organizations/ORGID/roles
  end

#properties
  def url
    @groups_and_users_url
  end

  def title
    'Video Marketing & Sales Enablement'
  end

#locators
  def action_bar_title
    @active_driver.find_element(:id, 'vy_actionbar_title')
  end

#functions

end

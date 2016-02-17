require_relative '../spec/spec_helper.rb'

class VidyardGuestPasswordPage
  def initialize(driver, base_url)
    # We are passing along the driver here to help with session management in the tests. This
    # lets us ensure that the elements being called are specific to this driver and no other.
    # Helps with concurrency.
    #
    # Taking in the base_url lets us have this page object be generic from staging to production.
    # Elements should be the same, only the base URL is changing. Please note that due to session
    # management, there is little reason to hit this page unauthenticated (and primarily through
    # a login path)
    @active_driver = driver
    @url = base_url + 'user/password/new'
  end

#properties
  def new_user_message

  end

#functions
  def switch_to_vidyard
    @active_driver.get(BASE_URL)
  end

  def new_user_message_block
    @active_driver.find_element(:css, 'div.alert')
  end

end
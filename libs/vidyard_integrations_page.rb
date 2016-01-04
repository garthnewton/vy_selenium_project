require_relative '../spec/spec_helper.rb'

class IntegrationsPage
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
    @integrations_url = base_url + 'user/oauth'
  end

#properties
  def url
    @integrations_url
  end

#locators
  def players_filter_toggle
    @active_driver.find_element(:id, 'show_views_breakdown').click
  end

  def new_salesforce_integration_button
    @active_driver.find_element(:link, 'Connect a Salesforce Account')
  end

end


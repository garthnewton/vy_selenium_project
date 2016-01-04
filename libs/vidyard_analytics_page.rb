require_relative '../spec/spec_helper.rb'

class VidyardAnalyticsPage
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
    @analytics_url = base_url + 'analytics'
  end

#properties
  def title
    'Video Marketing & Sales Enablement'
  end

  def url
    @analytics_url
  end

#locators
  def players_filter_toggle
    @active_driver.find_element(:id, 'show_views_breakdown')
  end

end


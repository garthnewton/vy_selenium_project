module CommonFeatures

  USE_VISIBLE_BROWSER = true # right now this is a constant; could be converted into a command line parameter

  # Code placed in this area would only be executed once.

  def create_active_driver!
    if USE_VISIBLE_BROWSER
      active_driver = Selenium::WebDriver.for :firefox #can also use :chrome or :safari
    else
      Process.spawn ("phantomjs --webdriver=9134")
      active_driver = Selenium::WebDriver.for(:remote, :url => 'http://localhost:9134')
    end

    active_driver.manage.timeouts.implicit_wait = 15
    active_driver.manage.window.resize_to(1920, 1080)

    return active_driver
  end

  def wait
    Selenium::WebDriver::Wait.new(:timeout => 30)
  end

  #Currently setup to look at the URL, however using /{comparison text}/ could work for Groups and Users
  # maybe use assert_equal instead of ==?
  def viewing_expected_page? (actual, expected)
    begin
      return actual.current_url == expected.url
    rescue
      return false
    end
  end

  def click_element (element)
    element.click
  end

  def is_checked? (element)
    element.selected?
  end

  def end_driver! (active_driver)
    active_driver.quit
  end
end

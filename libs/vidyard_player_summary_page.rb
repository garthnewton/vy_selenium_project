require_relative '../spec/spec_helper.rb'
class PlayerSummaryPage
  def initialize(driver)
    # We are passing along the driver here to help with session management in the tests. This
    # lets us ensure that the elements being called are specific to this driver and no other.
    # Helps with concurrency.
    @active_driver = driver
  end

#properties

#locators
  def action_bar_title
    @active_driver.find_element(:id, 'vy_actionbar_title')
  end

  def settings_button
    @active_driver.find_element(:css, 'a#settings_button')
  end

  def splash_screen_button
    @active_driver.find_element(:css, 'a.thumbnail_button')
  end

  def back_button
    @active_driver.find_element(:css, 'a.back')
  end

  def play_button
    @active_driver.find_element(:css, 'a.play_button')
  end

  def modify_chapters_button
    @active_driver.find_element(:id, 'edit_chapters')
  end


#functions

end

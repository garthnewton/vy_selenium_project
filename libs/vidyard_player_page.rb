require_relative '../spec/spec_helper.rb'
class PlayerSettingsPage
  def initialize(driver)
    # We are passing along the driver here to help with session management in the tests. This
    # lets us ensure that the elements being called are specific to this driver and no other.
    # Helps with concurrency.
    @active_driver = driver
  end

#properties
  def general_option_button_text
    'General'
  end

#locators

  def panel_title
    @active_driver.find_element(:css, 'h3.panel_title')
  end

  def player_name_field
    @active_driver.find_element(:id, 'player_name')
  end

  def player_description_field
    @active_driver.find_element(:id, 'player_description')
  end

  def player_sharing_message_field
    @active_driver.find_element(:id, 'player_viral_sharing_message')
  end

  def player_tag_field
    @active_driver.find_element(:id, 'new_tags')
  end

  def player_tag_remove
    @active_driver.find_element(:css, 'div.remove-button')
  end

  def player_options_save_button # TODO selenium doesn't like the javascript save button. need to find a good way to click save
    @active_driver.find_element(:link, 'Save Changes')
  end

  def back_button
    @active_driver.find_element(:css, 'a.back')
  end

  def success_banner
    @active_driver.find_element(:id, 'header_success')
  end

  def selected_submenu_button
    @active_driver.find_element(:css, '#submenu-bar .selected')
  end

  def video_tab
    @active_driver.find_element(:id, 'player-chapter-count')
  end

  def support_button
    @active_driver.find_element(:id, 'habla_sizebutton_a')
  end

#functions

end

require_relative '../spec/spec_helper.rb'

class VidyardDashboardPage
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
    @dashboard_url = base_url + 'dashboard'
  end

#properties
  def title
    'Video Marketing & Sales Enablement'
  end

  def url
    @dashboard_url
  end

  def new_player_modal_title
    'Select Chapters'
  end


#locators
  def new_player_button
    @active_driver.find_element(:id, 'import_button')
  end

  def first_player_edit_button
    @active_driver.find_element(:css, 'a.btn.btn-primary.edit')
  end

  def find_specific_player (player_name)
   @active_driver.find_element(:link, player_name)
  end

  def first_player_play_button
    @active_driver.find_element(:css, 'div.play-btn div.arrow')
  end

  def search_for_player (search_id)
    @active_driver.find_element(:id, 'query').send_keys(search_id, :enter)
    first_player_edit_button
  end

  #Player Preview Window locators
  def preview_window_close
    @active_driver.find_element(:css, 'div.vidyard_tcontent')
  end

  #New Player modal specific locators
  def new_player_modal_title_locator
    @active_driver.find_element(:id, 'myModalLabel')
  end

  def exit_modal_button
    @active_driver.find_element(:css, 'div.modal-header > button.close')
  end

  def save_selected_chapters
    @active_driver.find_element(:css, 'div.save')
  end

  ### Previously Uploaded modal entries
  def add_from_previously_uploaded
    @active_driver.find_element(:id, 'video_library')
  end

  def select_first_video
    @active_driver.find_element(:css, 'div.select_video')
  end

#functions

end



class PlayerWizardPage

  def initialize(driver)
    # We are passing along the driver here to help with session management in the tests. This
    # lets us ensure that the elements being called are specific to this driver and no other.
    # Helps with concurrency.
    @active_driver = driver
  end

#properties

#locators
  def wizard_save_button
    @active_driver.find_element(:css, 'div.save')
  end

  def wizard_close_button
    @active_driver.find_element(:css, 'div.modal-header > button.close')
  end

  ### Add From Your Computer modal entries
  def add_from_your_computer_button
    @active_driver.find_element(:id, 'upload_video')
  end

  def choose_video_file_button
    @active_driver.find_element(:css, 'a.qq-upload-button-selector')
  end

### Add From YouTube modal entries
  def add_from_youtube_button
    @active_driver.find_element(:id, 'youtube_import')
  end

  def youtube_search_by_video_field
    @active_driver.find_element(:id, 'youtube_query')
  end

  def youtube_search_by_user_id_field
    @active_driver.find_element(:id, 'youtube_user')
  end

  def youtube_search_by_url_field
    @active_driver.find_element(:id, 'youtube_url')
  end

  def search_youtube_button
    @active_driver.find_element(:css, 'div.search_button')
  end

  def select_first_youtube_result
    @active_driver.find_element(:xpath, "//ul[@id='youtube_results']/li/div[3]")
  end

  def unselect_first_youtube_result
    @active_driver.find_element(:css, "//ul[@id='youtube_results']/li/div[4]")
  end

  #Functions


end

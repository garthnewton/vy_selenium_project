require_relative '../spec/spec_helper.rb'

class SharingPage
  def initialize(driver, url, uuid)
    # We are passing along the driver here to help with session management in the tests. This
    # lets us ensure that the elements being called are specific to this driver and no other.
    # Helps with concurrency.
    #
    # Taking in the bsp_url lets us have this page object be generic from staging to production.
    # Elements should be the same, only the base URL is changing. Please note that due to session
    # management, there is little reason to hit this page unauthenticated (and primarily through
    # a login path)
    @active_driver = driver
    @player_url = url + uuid
    @uuid = uuid
  end

#properties

  def url
    @player_url
  end

#locators
  def play_button
    @active_driver.find_element(:css, 'button.play_button')
  end

  def email_gate_field
    @active_driver.find_element(:css, 'input#eg_visitor_email')
  end

  def email_gate_submit
    @active_driver.find_element(:css, 'button#eg_play_button')
  end

  def embed_form
    @active_driver.find_element(:css, '#open_embed_form > button.hovered-element')
  end

  def embed_code_copy
    @active_driver.find_element(:css, 'div#share_form>div.share_form_container>div.actions_container>button.embed_button')
  end

  def close_form_button
    @active_driver.find_element(:css, '#close_embed_form > button[type="button"]')
  end

  def mute_button
    @active_driver.find_element(:css, 'div.vjs-mute-control.vjs-control')
  end

  def close_cta_button
    @active_driver.find_element(:id, 'cta_close_433')
  end

  def open_playlist
    @active_driver.find_element(:id, 'playlist_container')
  end

#functions
  def load_sharing_page
    @active_driver.get(@player_url)
  end

end


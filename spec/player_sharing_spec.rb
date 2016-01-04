require_relative './spec_helper.rb'

describe 'User navigates to a player share page' do
  before(:all) do
    @driver = create_active_driver!
    @my_page=SharingPage.new(@driver, WATCHTOWER_URL, '0o2kYNzXYEzzPiDkHEbEcw')
    @my_page.load_sharing_page
    @my_email = "garth.newton+" + Time.now.to_i.to_s + "@vidyard.com"
  end #before

  after(:all) do
    @driver.quit
  end #after

  it 'should Play the video' do
    wait.until {@my_page.play_button.displayed?}
    @my_page.play_button.click
    wait
  end

  it 'should see an email gate' do
    wait.until {@my_page.email_gate_field.displayed?}
  end

  it 'enters an email and submits' do
    @my_page.email_gate_field.send_keys @my_email
    @my_page.email_gate_submit.click
  end

  it 'mutes and unmutes the player' do
    @my_page.mute_button.click
    wait
    @my_page.mute_button.click
  end

  it 'opens the sharing modal and closes it' do
    @my_page.embed_form.click
    wait.until {@my_page.close_form_button.displayed?}
     @my_page.close_form_button.click
  end

  it 'closes the cta' do
    @my_page.close_cta_button.click
  end

  it 'opens the playlist' do
    @my_page.open_playlist.click
  end
end

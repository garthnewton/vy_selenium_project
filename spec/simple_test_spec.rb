require_relative './spec_helper.rb'

describe 'Simple Browser check' do

  before(:all) do
    @driver = create_active_driver!
    @login_page = LoginPage.new(@driver, BASE_URL)
    @my_dashboard = VidyardDashboardPage.new(@driver, BASE_URL)
    @my_playerpage = PlayerSummaryPage.new(@driver)
    @my_settingspage = PlayerSettingsPage.new(@driver)
    @my_title = 'Changed on ' + Time.now.to_s
  end

  after(:all) do
    VidyardBanner.new(@driver).log_out_of_vidyard
    @driver.quit
  end

  it 'Opens the login page' do
    @login_page.open_web_page
    wait.until {@login_page.login_email_field.displayed?}
  end

  it 'adds user name and password' do
    @login_page.log_into_vidyard!(VIDYARD_LOGIN_NAME, VIDYARD_LOGIN_PASSWORD)
    wait.until {@my_dashboard.first_player_edit_button.displayed?}
  end

  it 'opens the first players summary page' do
    @my_dashboard.first_player_edit_button.click
    wait.until {@my_playerpage.settings_button.displayed?}
  end

  it 'opens the settings page' do
    @my_playerpage.settings_button.click
    wait.until {@my_settingspage.player_description_field.displayed?}
  end

  it 'changes the description' do
    @my_settingspage.player_description_field.clear
    @my_settingspage.player_description_field.send_keys(@my_title)
    @my_settingspage.player_options_save_button.click
    wait.until {@my_settingspage.success_banner.displayed?}

  end
end

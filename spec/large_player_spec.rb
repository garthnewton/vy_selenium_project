require_relative './spec_helper.rb'

describe 'User logs in and edits a player with more than 50 chapters' do

  before(:all) do
    @driver = create_active_driver!
    LoginPage.new(@driver, BASE_URL).log_into_vidyard(VIDYARD_LOGIN_NAME, VIDYARD_LOGIN_PASSWORD)
    VidyardDashboardPage.new(@driver, BASE_URL).search_for_player('YgVo6f9MyBQUHjVgx2PQ7g').click
    @summary_page = PlayerSummaryPage.new(@driver)
    @my_page = PlayerSettingsPage.new(@driver)
    @my_wizard = PlayerWizardPage.new(@driver)
    @my_title = 'Changed on ' + Time.now.to_s
  end

  after(:all) do
    VidyardBanner.new(@driver).log_out_of_vidyard
    @driver.quit
  end

  it 'and opens the wizard' do
    @summary_page.modify_chapters_button.click
    wait.until {@my_wizard.wizard_save_button.displayed?}
    @my_wizard.wizard_close_button.click
  end

  it 'adds a new video to the player' do
    @summary_page.modify_chapters_button.click
    @my_wizard.add_from_your_computer_button.click
    wait.until {@my_wizard.choose_video_file_button}
    @my_wizard.choose_video_file_button.click
    @my_wizard.wizard_close_button.click
  end
end

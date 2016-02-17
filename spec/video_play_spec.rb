require_relative './spec_helper.rb'

describe PlayerSettingsPage do

  describe 'User logs in and sees the dashboard' do
    before(:all) do
      @driver = create_active_driver!
      LoginPage.new(@driver, BASE_URL).log_into_vidyard!(VIDYARD_LOGIN_NAME, VIDYARD_LOGIN_PASSWORD)
    end

    after(:all) do
      VidyardBanner.new(@driver).log_out_of_vidyard
      @driver.quit
    end

    context 'wants to play the first player' do
      before(:all) do
        @my_page=VidyardDashboardPage.new(@driver, BASE_URL)
        @my_page.search_for_player('0o2kYNzXYEzzPiDkHEbEcw')
        wait.until {@my_page.first_player_play_button.displayed?}
        @my_page.first_player_play_button.click
      end

      it 'lets the video play for a few seconds before closing the player' do
        wait
        @my_page.preview_window_close.click
      end
    end

  end
end

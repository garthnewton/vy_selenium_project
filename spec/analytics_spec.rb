require_relative './spec_helper.rb'

describe VidyardAnalyticsPage do
  describe 'User logs in and is viewing the Vidyard Dashboard Page' do
    before(:all) do
      @driver = create_active_driver!
      LoginPage.new(@driver, BASE_URL).log_into_vidyard(VIDYARD_LOGIN_NAME, VIDYARD_LOGIN_PASSWORD)
      @my_page = VidyardAnalyticsPage.new(@driver, BASE_URL)
      @my_banner = VidyardBanner.new(@driver)
    end

    after(:all) do
      @my_banner.log_out_of_vidyard
      end_driver!(@driver)
    end

    it 'navigates to the analytics page' do
      @driver.wait.until { @my_banner.analytics_drop_down_menu.displayed? }
      click_element(@my_banner.analytics_drop_down_menu)
      expect(viewing_expected_page?(@driver, @my_page)).to be true
    end

    it 'checks the Show Views by Players box' do
      click_element(@my_page.players_filter_toggle)
      expect(is_checked?(@my_page.players_filter_toggle)).to be true
    end

    it 'and deselects it again' do
      click_element(@my_page.players_filter_toggle)
      expect(is_checked?(@my_page.players_filter_toggle)).to be false
    end
  end
end

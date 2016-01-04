require_relative './spec_helper.rb'

describe VidyardBanner do
  describe 'User logs in and interacts with the Banner' do
    before(:all) do
      @driver = create_active_driver!
      LoginPage.new(@driver, BASE_URL).log_into_vidyard(VIDYARD_LOGIN_NAME, VIDYARD_LOGIN_PASSWORD)
      @my_banner = VidyardBanner.new(@driver)
    end

    after(:all) do
      @my_banner.log_out_of_vidyard
      end_driver!(@driver)
    end

    it 'clicks the Dashboard link and expects to see the dashboard page' do
      click_element(@my_banner.dashboard_link)
      expected_page = VidyardDashboardPage.new(@driver, BASE_URL)
      expect(viewing_expected_page?(@driver, expected_page)).to be true
    end

    it 'clicks the Analytics link and expects to see the analytics page' do
      click_element(@my_banner.analytics_drop_down_menu)
      click_element(@my_banner.analytics_link)

      expected_page = VidyardAnalyticsPage.new(@driver, BASE_URL)
      expect(viewing_expected_page?(@driver, expected_page)).to be true
    end
  end
end

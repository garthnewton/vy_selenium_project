require_relative './spec_helper.rb'

describe LoginPage do

    LOGIN_BAD_PASSWORD = 'badpassword'
    LOGIN_BAD_EMAIL = 'bademail@bad.email'

  describe 'User arrives at the Vidyard login page' do
    before(:all) do
      @driver = create_active_driver!
      @my_page = LoginPage.new(@driver, BASE_URL)
    end

    after(:all) do
      @driver.quit
    end

    before(:each) do
      @driver.get(@my_page.url)
      expect(viewing_expected_page?(@driver, @my_page)).to eq(true)
    end

    context 'with a valid set of credentials' do
      after(:all) do
        #Using the user drop down menu, log out as the user would
        VidyardBanner.new(@driver).log_out_of_vidyard
      end

      it 'enters a valid email address and password then logs in expecting the Dashboard page' do
        @my_page.log_into_vidyard(VIDYARD_LOGIN_NAME, VIDYARD_LOGIN_PASSWORD)
        @driver.wait.until {/Video Marketing & Sales Enablement/.match(@driver.title)}
        expect(@driver.title).to eq('Video Marketing & Sales Enablement') #should be a property for the Dashboard page object
      end
    end

    context 'with an invalid password' do
      it 'enters a valid email address with an invalid password expecting to see an error' do
        @my_page.log_into_vidyard(VIDYARD_LOGIN_NAME, LOGIN_BAD_PASSWORD)
        expect(@my_page.login_message_block.text).to include(@my_page.login_error_message)
      end
    end

    context 'with an invalid email' do
      it 'enters an invalid email address with any password expecting to see an error' do
        @my_page.log_into_vidyard(LOGIN_BAD_EMAIL, VIDYARD_LOGIN_PASSWORD)
        expect(@my_page.login_message_block.text).to include(@my_page.login_error_message)
      end
    end
  end
end

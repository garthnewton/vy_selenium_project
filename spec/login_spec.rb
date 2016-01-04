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

    context 'with a valid set of credentials' do
      before(:all) do
        @driver.get(@my_page.url)
      end

      after(:all) do
        #Using the user drop down menu, log out as the user would
        VidyardBanner.new(@driver).log_out_of_vidyard
      end

      it 'expects to see the login page' do
        expect(viewing_expected_page?(@driver, @my_page)).to eq(true)
      end

      it 'enters an email address for login' do
        @my_page.login_email_field.send_keys VIDYARD_LOGIN_NAME
      end

      it 'enters a password for login' do
        @my_page.login_password_field.send_keys VIDYARD_LOGIN_PASSWORD
      end

      it 'clicks the login button' do
        @my_page.login_button.click
      end

      it 'and expects to see the dashboard page' do
        expect(@driver.title).to eq('Video Marketing & Sales Enablement') #should be a property for the Dashboard page object
      end
    end

    context 'with an invalid password' do
      before(:all) do
        @driver.get(@my_page.url)
      end

      it 'expects to see the login page' do
        expect(viewing_expected_page?(@driver, @my_page)).to eq(true)
      end

      it 'enters a valid email address' do
        @my_page.login_email_field.send_keys VIDYARD_LOGIN_NAME
      end

      it 'enters an invalid password' do
        @my_page.login_password_field.send_keys LOGIN_BAD_PASSWORD
      end

      it 'clicks the login button' do
        @my_page.login_button.click
      end

      it 'and expects to see an error' do
        expect(@my_page.login_message_block.text).to include(@my_page.login_error_message)
      end
    end

    context 'with an invalid email' do
      before(:all) do
        @driver.get(@my_page.url)
      end

      it 'expects to see the login page' do
        expect(viewing_expected_page?(@driver, @my_page)).to eq(true)
      end

      it 'enters an invalid email address' do
        @my_page.login_email_field.send_keys LOGIN_BAD_EMAIL
      end

      it 'enters any password' do
        @my_page.login_password_field.send_keys VIDYARD_LOGIN_PASSWORD
      end

      it 'clicks the login button' do
        @my_page.login_button.click
      end

      it 'and expects to see an error' do
        expect(@my_page.login_message_block.text).to include(@my_page.login_error_message)
      end
    end
  end
end

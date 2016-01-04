require_relative './spec_helper.rb'

describe SalesforceLoginPage do
  describe 'User wants to see if the new lead has been added to Salesforce' do
    before(:all) do
      @driver = create_active_driver!
      @my_page = SalesforceLoginPage.new(@driver, SALESFORCE_LOGIN_URL)
      @my_banner = SalesforceBanner.new(@driver)
      @lead_email = 'garth.newton+14Sep@vidyard.com'.to_s
    end

    after(:all) do
      @driver.quit
    end

    context 'Sees the Salesforce login page and logs in with a valid set of credentials' do
      before(:all) do
        @driver.get(@my_page.url)
      end

      after(:all) do
        #Using the user drop down menu, log out as the user would
        @my_banner.log_out_of_salesforce
      end

      it 'expects to see the login page' do
        expect(viewing_expected_page?(@driver, @my_page)).to eq(true)
      end

      it 'logs in' do
        @my_page.log_into_salesforce(SALESFORCE_LOGIN_NAME, SALESFORCE_LOGIN_PASSWORD)
      end

      it 'clicks the Leads tab' do
        @my_banner.leads_link.click
      end

      it 'clicks the specific lead' do
        SalesforceLeadsSummary.new(@driver).open_specific_lead(@lead_email).click
      end

    end



  end


end

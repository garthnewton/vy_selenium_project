require_relative './spec_helper.rb'

describe 'User wants to see if the new data has been added to Eloqua' do

  before(:all) do
    @driver = create_active_driver!
    @my_page = EloquaLoginPage.new(@driver, ELOQUA_LOGIN_URL)
    @my_banner = EloquaBanner.new(@driver)
    @my_contacts = EloquaContactsPage.new(@driver)
  end

  after(:all) do
    @driver.quit
  end

  it 'expects to see the login page' do
    @my_page.open_web_page
    wait.until {@my_page.eloqua_username.displayed?}
    expect(viewing_expected_page?(@driver, @my_page)).to eq(true)
  end

  it 'logs in' do
    @my_page.log_into_eloqua(ELOQUA_COMPANY_NAME, ELOQUA_LOGIN_NAME, ELOQUA_PASSWORD)
  end

  it 'opens the Contacts pane' do
    @my_banner.navigate_to_contacts_page
  end

  it 'searches for a contact' do
    @my_contacts.search_for_contact!('3nov')
  end
end
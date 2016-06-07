require_relative './spec_helper.rb'


describe 'Accessibility review the dashboard page' do

  before(:all) do
    @driver = create_active_driver!
    # @my_page = LoginPage.new(@driver, BASE_URL)
    # @my_page.log_into_vidyard(VIDYARD_LOGIN_NAME, VIDYARD_LOGIN_PASSWORD)

    @driver.get("http://automation.hubs.staging-qa.vidyard.com/watch/6EXF_P5yBjrlVDaMnEaIJw")
  end

  after(:all) do
    @driver.quit
  end

  context  do
    it 'should find no errors' do

      # check_analytics(@driver)
      raaktest = Raakt::Test.new(@driver.page_source)
      result = raaktest.all
      puts result

    end
  end

end
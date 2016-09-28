require_relative './spec_helper.rb'

describe VidyardDashboardPage do
  describe 'User logs in and is viewing the Vidyard Dashboard Page' do
    before(:all) do
      @driver = create_active_driver!
      LoginPage.new(@driver, BASE_URL).log_into_vidyard(VIDYARD_LOGIN_NAME, VIDYARD_LOGIN_PASSWORD)
      @my_page = VidyardDashboardPage.new(@driver, BASE_URL)
      @my_wizard = PlayerWizardPage.new(@driver)
    end #before

    after(:all) do
      VidyardBanner.new(@driver).log_out_of_vidyard
      end_driver!(@driver)
    end

    it 'expects to be on the Dashboard page' do
      @driver.wait.until {/Video Marketing & Sales Enablement/.match(@driver.title)}
      expect(viewing_expected_page?(@driver, @my_page)).to be true
    end

    context 'wants to add a new player' do

      after(:all) do
        click_element(VidyardBanner.new(@driver).dashboard_link)
      end

      context 'from their existing video library' do
        after(:all) do
          @driver.wait.until {VidyardBanner.new(@driver).user_drop_down_menu.displayed?}
        end

        it 'and presses the New Player button' do
          sleep(1)
          click_element(@my_page.new_player_button)
        end

        it 'expecting to see the Select Chapters modal' do
          @driver.wait.until {@my_page.new_player_modal_title_locator.displayed?}
          expect(@my_page.new_player_modal_title_locator.text).to eq(@my_page.new_player_modal_title)
        end

        it 'focus on the Previously Uploaded Videos tab' do
          click_element(@my_page.add_from_previously_uploaded)
        end

        it 'and chooses the first video provided' do
          click_element(@my_page.select_first_video)
        end
      end #context "from their existing video library"

      context 'from a YouTube upload' do
        it 'focus on the Add From YouTube tab' do
          click_element(@my_wizard.add_from_youtube_button)
        end

        it 'adds the name of a YouTube video' do
          @my_wizard.youtube_search_by_video_field.send_keys('vidyard')
        end

        it 'and presses the Search YouTube button' do
          click_element(@my_wizard.search_youtube_button)
        end

        # it 'and chooses the first video provided' do
        #   click_element(@my_wizard.select_first_youtube_result) #TODO search youtube is broken. make sure this works when it is not broken
        # end
        #
        # it 'and unselects that video' do
        #   click_element(@my_wizard.unselect_first_youtube_result)
        # end

      end #context "from a YouTube upload"

      context 'and once finished' do
        it 'saves the currently selected chapters' do
          click_element(@my_page.save_selected_chapters) #this takes the user to the players page
        end

        it 'and is taken to the player page for the new player they just added' do
          @my_page = PlayerSummaryPage.new(@driver)
          wait.until {@my_page.settings_button.displayed?}
          expect(@driver.current_url).to match(/players/)
        end
      end #context "and once finished"
    end #context "wants to add a new player"

    context 'wants to edit an existing player' do

      after(:all) do
        click_element(VidyardBanner.new(@driver).dashboard_link)
      end

      it 'clicks the Edit button for the first player' do
        click_element(@my_page.first_player_panel)
        sleep(2)
        click_element(@my_page.first_player_edit_button)
      end

      it 'and is taken to the player page for the first player in the list' do
          @my_page = PlayerSummaryPage.new(@driver)
          wait.until {@my_page.settings_button.displayed?}
          expect(@driver.current_url).to match(/players/)
      end
    end #context "wants to edit an existing player"
  end #describe "User logs in and is viewing the Vidyard Dashboard Page"
end #describe DashboardPage

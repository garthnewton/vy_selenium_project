require_relative './spec_helper.rb'

describe PlayerSettingsPage do

  describe 'User logs in and edits an existing player' do
    before(:all) do
      @driver = create_active_driver!
      LoginPage.new(@driver, BASE_URL).log_into_vidyard(VIDYARD_LOGIN_NAME, VIDYARD_LOGIN_PASSWORD)
      VidyardDashboardPage.new(@driver, BASE_URL).first_player_edit_button.click
      @summary_page = PlayerSummaryPage.new(@driver)
      @my_page = PlayerSettingsPage.new(@driver)
      @my_title = 'Changed on ' + Time.now.to_s
    end

    after(:all) do
      VidyardBanner.new(@driver).log_out_of_vidyard
      @driver.quit
    end

    it 'and sees the player page they are expecting' do
      # @summary_page.settings_button.click
      wait.until {@summary_page.settings_button.displayed?}
      expect(@driver.current_url).to match(/players/)
    end

    context 'wants to change the player name' do
      before(:all) do
        @summary_page.settings_button.click
        expect(@driver.current_url).to match(/settings/)
        expect(@my_page.panel_title.text).to eq(@my_page.player_option_panel_title)
      end

      it 'clears the field and types the name of the Player' do
        @my_page.player_name_field.clear
        @my_page.player_name_field.send_keys(@my_title)
      end

      it 'then saves the changes' do
        @my_page.player_options_save_button.click
        @my_page.back_button.click  #returns the user to the player page
      end

      it 'and expects to see the updated name on the player page' do

        wait.until {@summary_page.settings_button.displayed?}
        expect(@driver.current_url).to match(/players/)
        expect(@summary_page.action_bar_title.text).to eq(@my_title)
      end

    end #context "wants to change the player name"

    context 'wants to change the player description' do
      before(:all) do
        @summary_page.settings_button.click
        expect(@driver.current_url).to match(/settings/)
      end

      it 'changes the description for the Player' do
        @my_page.player_description_field.clear
        @my_page.player_description_field.send_keys('blah blah blah') #this changes the field, however I've not found where the description is displayed yet
      end

      it 'then saves the changes' do
        @my_page.player_options_save_button.click
        @my_page.back_button.click #returns the user to the player page
      end
    end #context "wants to change the player description"

    context 'wants to change the player sharing message' do
      before(:all) do
        @summary_page.settings_button.click
        expect(@driver.current_url).to match(/settings/)
      end

      it 'changes the sharing message for the Player' do
        @my_page.player_sharing_message_field.clear
        @my_page.player_sharing_message_field.send_keys('Sharing is caring') #this changes the field, however I've not found where the sharing message is displayed yet
      end

      it 'then saves the changes' do
        @my_page.player_options_save_button.click
        @my_page.back_button.click #returns the user to the player page
      end
    end #context "wants to change the player sharing message"

    context 'wants to change the player tag list' do
      before(:all) do
        @summary_page.settings_button.click
        expect(@driver.current_url).to match(/settings/)
      end

      it 'changes the tag list for the Player' do
        @my_page.player_tag_field.clear
        @my_page.player_tag_field.send_keys('1 2 3 4') #this changes the field, however I've not found where the tag list is displayed yet
        @my_page.player_tag_field.send_keys :enter
      end

      it 'deletes the just added tag' do
        @my_page.player_tag_remove.click #removes the first tag it finds; should be the only tag
      end

      it 'then saves the changes' do
        @my_page.player_options_save_button.click
        @my_page.back_button.click #returns the user to the player page
      end
    end

  end
end

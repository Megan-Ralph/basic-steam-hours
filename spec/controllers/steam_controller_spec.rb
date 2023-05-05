require 'rails_helper'

RSpec.describe SteamController, type: :controller do
  describe "GET #get_hours" do
    it "returns the total hours played for the specified Steam user" do
      username = "mo_omo_o"
      api_key = Rails.application.secrets.steam_key
      stub_request(:any, /api.steampowered.com/).to_return(body: {
        response: {
          games: [
            {
              playtime_forever: 500
            },
            {
              playtime_forever: 1000
            }
          ]
        }
      }.to_json)
      get :get_hours, params: { username: username }
      expect(response.body).to include("Total hours played: 25.0")
    end
  end
end

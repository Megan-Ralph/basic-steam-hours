require 'steam-api'

class SteamController < ApplicationController
  def get_hours
    username = params[:username]
    api = SteamApi::Client.new(api_key: Rails.application.secrets.steam_key)
    steam_id = api.resolve_vanity_url(username).steam_id
    games = api.player_recently_played_games(steam_id: steam_id).games
    hours = games.map(&:playtime_forever).sum / 60.0
    render plain: "Total hours played: #{hours}"
  end
end

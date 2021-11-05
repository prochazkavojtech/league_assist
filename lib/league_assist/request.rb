module LeagueAssist
  class Request
    BASE_URL = 'https://%s.api.riotgames.com/'.freeze

    def request(region, api)
      connection = Faraday.new do |conn|
        conn.url_prefix = format BASE_URL, region
        conn.request :json
        conn.response :json, content_type: 'application/json'
        conn.request :retry, max: 10
      end

      response = connection.get(api, {}, { 'X-Riot-Token' => LeagueAssist.api_key })

      response.body
    end
  end
end
module LeagueAssist
  class Summoner < Request
    attr_accessor :name, :id, :puuid, :region, :server

    def initialize(name: nil, server: nil)
      account = request(server, "/lol/summoner/v4/summoners/by-name/#{name}")
      @id = account['id']
      @puuid = account['puuid']
      @name = account['name']
      @server = server
      @region = get_region(server)
    end


    def get_region(server)
      case server
      when 'br1', 'la1', 'la2', 'na1'
        'americas'
      when 'jp1', 'kr', 'oc1'
        'asia'
      when 'eun1', 'euw1', 'tr1', 'ru'
        'europe'
      end
    end
  end
end
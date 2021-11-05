module LeagueAssist
  class Match < Request
    VERSION = 'v5'.freeze

    def initialize(match_hash)
      meta_data = match_hash['metadata']
      info = match_hash['info']
      participants = meta_data['participants']
      @id = meta_data['matchId']
      @game_id = info['gameId']
      @duration = info['gameDuration']
      @started = parse_time(info['gameCreation'])
      @ended = parse_time(info['gameEndTimestamp'])
      @type = info['gameType']
      @game_version = info['gameVersion']
      @map_id = info['mapId']
      @participants = []

      participants.each do |puuid|
        @participants << Participant.new(info['participants'].find { |p| p['puuid'] == puuid })
      end

      create_getters
    end

    private

    def parse_time(timestamp)
      Time.at(timestamp.to_i / 1000)
    end

    def create_getters
      instance_variables.each do |v|
        define_singleton_method(v.to_s.tr('@','')) do
          instance_variable_get(v)
        end
      end
    end
  end
end
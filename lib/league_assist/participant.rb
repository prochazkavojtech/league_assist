module LeagueAssist
  class Participant < Request
    VERSION = 'v5'.freeze

    def initialize(p_hash)
      @team = p_hash['teamId']
      @name = p_hash['summonerName']
      @kills = p_hash['kills']
      @assists = p_hash['assists']
      @deaths = p_hash['deaths']
      @minions = p_hash['neutralMinionsKilled']
      @champion = p_hash['championName']
      @level = p_hash['champLevel']
      @doubles = p_hash['doubleKills']
      @triples = p_hash['tripleKills']
      @quadras = p_hash['quadraKills']
      @pentas = p_hash['pentaKills']
      @had_firstblood = p_hash['firstBloodKill']
      @assisted_firstblood = p_hash['firstBloodAssist']
      @first_tower = p_hash['firstTowerKill']
      @gold_earned = p_hash['goldEarned']
      @position = p_hash['individualPosition']
      @items = p_hash.select { |k, v| k.to_s.include?('item') }
      @stats = p_hash.select { |k, v| k.to_s.include?('largest') || k.to_s.include?('longest') }
      @damage = p_hash.select { |k, v| k.to_s.include?('Damage') }
      @total = p_hash.select { |k, v| k.to_s.include?('total') && !k.to_s.include?('Damage') }
      @killing_sprees = p_hash['killingSprees']
      @lane = p_hash['lane']
      @role = p_hash['role']
      @t_position = p_hash['teamPosition']
      @s_wards_bought = p_hash['sightWardsBoughtInGame']
      @s_wards = p_hash['wardsPlaced']
      @c_wards_bought = p_hash['visionWardsBoughtInGame']
      @c_wards = p_hash['detectorWardsPlaced']
      @wards_destroyed = p_hash['wardsKilled']
      @perks = p_hash['perks']
      @summoner_spells = [p_hash['summoner1Id'], p_hash['summoner2Id']]
      @turret_destroyed = p_hash['turretKills']
      @vision_score = p_hash['visionScore']
      @win = p_hash['win']

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
class AccessLogApi
  class << self
    # paramsは検索条件が入力されている想定
    def search(params = {})
      uri = URI.parse('https://samples.jnito.com/access-log.json')
      json = Net::HTTP.get(uri)
      data_list = JSON.parse(json, symbolize_names: true)
      data_list.map do |data|
        AccessLog.new(**data)
      end
    end
  end
end

class AccessLogApi
  class << self
    def search(params = {})
      # paramsを使って柔軟に検索パラメータを追加できる想定（だが、下記URLは静的なレスポンスしか返さないので未実装）
      uri = URI.parse('https://samples.jnito.com/access-log.json')
      json = Net::HTTP.get(uri)
      data_list = JSON.parse(json, symbolize_names: true)
      data_list.map do |data|
        AccessLog.new(data)
      end
    end
  end
end

class AccessLog
  include ActiveModel::Model
  include ActiveModel::Attributes

  attribute :request_id, :integer
  attribute :path, :string
  attribute :status, :integer
  attribute :duration, :float
  attribute :error, :string, default: ''

  class << self
    def all
      AccessLogApi.search
    end
  end

  def has_error?
    status.to_s.match?(/^[45]/)
  end
end

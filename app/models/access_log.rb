class AccessLog
  include ActiveModel::Model
  include ActiveModel::Attributes

  attribute :request_id, :integer
  attribute :path, :string
  attribute :status, :integer
  attribute :duration, :float
  attribute :error, :string

  class << self
    def all
      AccessLogApi.search
    end
  end
end

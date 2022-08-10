require 'rails_helper'

RSpec.describe AccessLogApi, type: :model do
  describe '.search' do
    context 'without params' do
      it 'returns all records', vcr: true do
        access_logs = AccessLogApi.search
        # NOTE: cassetteを再生成すると以下の結果は変わる可能性があるため、適宜修正する
        expect(access_logs.size).to eq 4
        expect(access_logs[0]).to have_attributes(
          request_id: 1,
          path: '/products/1',
          status: 200,
          duration: 651.7,
          error: ''
        )
      end
    end
  end
end

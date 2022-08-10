require 'rails_helper'

RSpec.describe 'Access Logs', type: :system do
  describe '#index' do
    before do
      access_logs = FactoryBot.build_list(:access_log, 10)
      allow(AccessLogApi).to receive(:search).and_return(access_logs)
    end
    it 'shows all data' do
      visit root_path
      rows = all('.access-log-table tbody tr')
      expect(rows.size).to eq 10
      within rows[0] do
        expect(page).to have_content '/users/1'
      end
    end
  end
end

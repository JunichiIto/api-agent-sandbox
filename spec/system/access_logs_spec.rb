require 'rails_helper'

RSpec.describe 'Access Logs', type: :system do
  describe '#index' do
    it 'shows all data' do
      visit root_path
      rows = all('.access-log-table tbody tr')
      expect(rows.size).to eq 4
      within rows[0] do
        expect(page).to have_content '/products/1'
      end
    end
  end
end

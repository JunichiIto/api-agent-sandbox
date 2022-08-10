require 'rails_helper'

RSpec.describe AccessLog, type: :model do
  describe 'initialize' do
    it 'creates an instance' do
      access_log = AccessLog.new(
        request_id: 1,
        path: '/users',
        status: 500,
        duration: 1.3,
        error: 'Something went wrong.'
      )
      expect(access_log).to have_attributes(
        request_id: 1,
        path: '/users',
        status: 500,
        duration: 1.3,
        error: 'Something went wrong.'
      )
    end
  end
end

require 'rails_helper'

RSpec.describe AccessLog, type: :model do
  describe '#initialize' do
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

  describe '#has_error?' do
    it 'returns true when status is 4__ or 5__' do
      access_log = AccessLog.new

      access_log.status = 200
      expect(access_log.has_error?).to be_falsey

      access_log.status = 302
      expect(access_log.has_error?).to be_falsey

      access_log.status = 404
      expect(access_log.has_error?).to be_truthy

      access_log.status = 500
      expect(access_log.has_error?).to be_truthy
    end
  end
end

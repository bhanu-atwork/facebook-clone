require 'rails_helper'

module Helpers
  module AuthHelper
    def require_login_as(user)
      allow_any_instance_of(ActionDispatch::Request).to receive(:session) { { user_id: user.id } }
    end
  end
end
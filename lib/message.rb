# frozen_string_literal: true

class Message
  class << self
    def not_found(record = 'record')
      "Sorry, #{record} not found."
    end

    def unauthorized
      'Unauthorized request!'
    end

    def invalid_account
      'Invalid username or password!'
    end

    def logout
      'Logout success!'
    end

    def pagy_overflow
      'Paginate Overflow'
    end
  end
end

module Fulcrum
  class User < Api

    class << self

      def all(opts = {})
        params = parse_opts([:page], opts)
        call(:get, 'users.json', params)
      end

      def find(id)
        call(:get, "users/#{id}.json")
      end
    end
  end
end

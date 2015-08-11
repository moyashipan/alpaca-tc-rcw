module Recipe
  class Mapping
    class User < Base
      self.record_name = 'users'

      attr_reader :id, :user_name
    end
  end
end

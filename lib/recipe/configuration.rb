module Recipe
  class Configuration < Hash
    class MissingConfiguration < StandardError; end

    def require_keys!(*keys)
      keys.each do |key|
        raise MissingConfiguration, "required #{key}." if Recipe.configuration[key].nil?
      end
    end
  end
end

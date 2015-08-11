module Recipe
  class Mapping
    class Base
      class << self
        attr_accessor :mapping_key

        def all
          Mapping.data[mapping_key].map { |attributes| new(attributes) }
        end

        def find(id)
          all.find { |row| row['id'] == id }
        end

        def attr_reader(*attributes)
          attributes.each do |attr|
            define_attribute_method(attr)
          end
        end

        def define_attribute_method(key1, klass = nil, key2 = nil)
          define_method(key1) do
            if klass.nil?
              self[key1]
            else
              if self[key2]
                id = self[key2]
                klass.find(id)
              else
                self[key1]
              end
            end
          end
        end
      end

      attr_reader :attributes
      alias_method :to_h, :attributes

      def initialize(attributes = {})
        @attributes = attributes
      end

      def [](key)
        # indifferent access
        @attributes[key.to_sym] || @attributes[key.to_s]
      end
    end
  end
end

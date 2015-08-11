module Recipe
  class Mapping
    class Base
      class << self
        attr_accessor :record_name

        def all
          Mapping.data[record_name].map { |attributes| new(attributes) }
        end

        def find(id)
          all.find { |row| row['id'] == id }
        end

        def from_attributes(*attributes)
          new(*attributes)
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
        @attributes[key.to_sym] || @attributes[key.to_s]
      end

      private

      def attributes_for_object(key1, key2=nil)
        if key2.nil?
          self[key1]
        else
          attributes = @attributes.dup
          attributes.delete(key1).merge(key2 => attributes)
        end
      end
    end
  end
end

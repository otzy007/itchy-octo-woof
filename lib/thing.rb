class Module
  # Macro
  def my_attr_accessor(name, type)
    # Getter
    define_method(name) do
      instance_variable_get("@#{name}")
    end

    # Setter
    define_method("#{name}=") do |value|
      # Raise a TypeError if trying to assign a value with a different type
      raise TypeError, "#{value} is not of type #{type}" unless value.is_a?(type)

      instance_variable_set("@#{name}", value)
    end
  end
end

class Thing
  # my_attr_accessor contains one extra parameter, the type of the instance variable
  my_attr_accessor :my_string, String
  my_attr_accessor :my_int, Integer
  my_attr_accessor :my_hash, Hash
  my_attr_accessor :my_thing, Thing

  def initialize(hash = {})
    # for each parameter call it's setter
    hash.each do |k, v|
      send("#{k}=", v)
    end
  end
end

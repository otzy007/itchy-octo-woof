require 'minitest/autorun'
require 'thing'

class TestThing < MiniTest::Unit::TestCase
  def setup
    @thing = Thing.new
    @thing_with_values = Thing.new(
      my_string: 'lol',
      my_int: 1,
      my_hash: { test: 'hash' },
      my_thing: Thing.new(my_string: 'test')
    )
  end

  def test_new_empty_object_creation
    assert_instance_of Thing, Thing.new
  end

  def test_creation_with_a_string
    thing = Thing.new(my_string: 'lol')

    assert_instance_of String, thing.my_string
    assert_equal 'lol', thing.my_string
  end

  def test_creation_with_an_int_a_string_a_hash_and_a_thing
    thing = @thing_with_values

    assert_instance_of String, thing.instance_variable_get("@my_string")
    assert_equal 'lol', thing.instance_variable_get("@my_string")
    assert_kind_of Integer, thing.instance_variable_get("@my_int")
    assert_equal 1, thing.instance_variable_get("@my_int")
    assert_instance_of Hash, thing.instance_variable_get("@my_hash")
    assert_equal({ test: 'hash' }, thing.instance_variable_get("@my_hash"))
    assert_instance_of Thing, thing.instance_variable_get("@my_thing")
  end

  def test_creation_with_a_wrong_type
    assert_raises(TypeError) { Thing.new(my_string: Object.new) }
  end

  def test_my_string_setter
    @thing.my_string = 'lol'

    assert_instance_of String, @thing.instance_variable_get("@my_string")
    assert_equal 'lol', @thing.instance_variable_get("@my_string")
  end

  def test_my_int_setter
    @thing.my_int = 2

    assert_kind_of Integer, @thing.instance_variable_get("@my_int")
    assert_equal 2, @thing.instance_variable_get("@my_int")
  end

  def test_my_hash_setter
    @thing.my_hash = { test: 'hash' }

    assert_instance_of Hash, @thing.instance_variable_get("@my_hash")
    assert_equal({ test: 'hash' }, @thing.instance_variable_get("@my_hash"))
  end

  def test_my_thing_setter
    @thing.my_thing = Thing.new(my_string: 'test')

    assert_instance_of Thing, @thing.instance_variable_get("@my_thing")
  end

  def test_wrong_my_string_type_set
    assert_raises(TypeError) { @thing.my_string = Hash.new }
  end

  def test_wrong_my_int_type_set
    assert_raises(TypeError) { @thing.my_int = Hash.new }
  end

  def test_wrong_my_hash_type_set
    assert_raises(TypeError) { @thing.my_hash = String.new }
  end

  def test_my_string_getter
    @thing.instance_variable_set("@my_string", 'lol')

    assert_equal 'lol', @thing.my_string
  end

  def test_my_int_getter
    assert_equal 1, @thing_with_values.my_int
  end

  def test_my_hash_getter
    assert_equal({ test: 'hash' }, @thing_with_values.my_hash)
  end
end

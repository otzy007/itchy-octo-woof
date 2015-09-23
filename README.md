## Usage
`my_attr_accessor` works the same way attr_accessor works in ruby except that it needs an extra parameter, the type.

The type is checked when setting a new value and in case the type is not right it will raise a TypeError exception.

### Example Usage
```
class Thing
  my_attr_accessor :my_string, String
end
```

for the method `my_string` only objects of type String will be accepted.
Example:
```
thing = Thing.new(my_string: 'some string')
thing.my_string = 'lol'
```

## Tests
In order to run the tests execute:
```
rake test
```

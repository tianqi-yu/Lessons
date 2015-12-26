## OOP in Ruby

### Intro
- Everything in Ruby is an object
  - that means that everything has properties and methods contained inside it
  - even the data types you're used to are objects, and we're gonna mess 'em up today to prove it
  - literally everything "inherits" from the Object Class, which just like the real life gene pool, means it gets all it's parents traits

### Classes
- [Ruby Doc](http://ruby-doc.org/core-2.2.0/Class.html)

##### Definition

```ruby
class MyClass
end
```

##### Instantiating

```ruby
class MyClass
end

obj = MyClass.new
```

Let's start with something fun & simple so you can get the hang of it.

```ruby
class BananaStand
end
```

There's no real information in there yet, but now that we've defined it, exists. How do we make a new Banana, then?

```ruby
my_banana = BananaStand.new
```

- Nice, that's called initializing a new instance. When thinking in objects, we consider this class kind of like a blueprint for all other bananas (or objects) we make, and an instance is a clone of that class.
- For example, you'd consider the chair you're in now a single instance of a chair - it was created using the known traits of a chair. You would consider the concept of a chair, in general, the class. All chairs are create using the known traits of the Chair Class, or the concept of a chair.

### Attributes

##### Attribute Methods
- [Ruby Doc](http://ruby-doc.org/core-2.0.0/Module.html#method-i-attr_accessor)

`attr_reader` vs. `attr_writer` vs. `attr_accessor`

```ruby
class MyClass

  def initialize(size)
    @size = size
  end

  def size        # attr_reader
    @size
  end

  def size=(val)  # attr_writer
    @size = val
  end
end

# you could the access @size variable as
# a = GotAccessor.new(5)
# x = a.size
# a.size = y
```

##### Instance Attributes (@)

```ruby
class MyClass
  def initialize(value)
    @foo = value
  end
end

obj = MyClass.new("hi there")
```

##### Class Attributes (@@)

```ruby
class MyClass
  def initialize(value)
    @@foo = value
  end

  def foo
    @@foo
  end
end

obj1 = MyClass.new("hi there")
obj1.foo
obj2 = MyClass.new("how are you")
obj2.foo
obj1.foo
```

```ruby
class MyClass
  @@value = 1
  def add_one
    @@value= @@value + 1
  end

  def value
    @@value
  end
end
instanceOne = MyClass.new
instanceTwo = MyClass.new
puts instanceOne.value
instanceOne.add_one
puts instanceOne.value
puts instanceTwo.value
```

##### Default Attribute value

```ruby
class MyClass
  attr_accessor :foo
  def initialize(value=50)
    @foo = value
  end
end

obj1 = MyClass.new
obj1.foo
```

##### Getter / Setter

Using code, let's see if we can find a way to describe what bananas are all about. How would we do this if it were a hash? Maybe something like:

```ruby
my_hashed_banana_stand = {
  color: "yellow",
  opened_in: 1953,
  manager: "George Michael",
  money: true
}
```

Those are all excellent properties, let's see how we'd make those into attributes of our object.

```ruby
class BananaStand
  def color
    "yellow"
  end
  def opened_in
    2015
  end
  def manager
    "George Michael"
  end
  def accepts_credit_cards
    true
  end
end

my_banana_stand = BananaStand.new
my_banana_stand.color # => yellow
my_banana_stand.manager # => George Micael
my_banana_stand.money #=> True
# etc.
```

Excellent, we call those "getters" or "getter methods", because they're getting information from inside our object, but the problem here is that our info is hardcoded.

Imagine we're making multiple instances of the model - we want a lot of banana stands - we might need to change who the manager is for each instance of the banana stand.

This is where we start mixing in what we know about variables. Specifically, instance variables.

```ruby
class BananaStand
  def color
    "yellow"
  end
  def opened_in
    2015
  end
  def accepts_credit_cards
    true
  end

  # getter for "manager"
  def manager
    @manager # this could, for the record, be named whatever you like, but it's best to keep it obvious & simple
  end

  # setter for "manager"
  def manager=(the_name_of_my_manager)
    @manager = the_name_of_my_manager
  end

end
```

That's interesting – it's sort of just a normal method with one argument, it just happens to have an `=` in the name. `manager=` instead of just `manager`

Let's see it in action.

```ruby
my_banana_stand = BananaStand.new
my_banana.manager # => nil, we haven't set it
my_banana.manager = "Tobias" # hey, look manager=, just with a space
my_banana.manager # => "Tobias"
```

That's fantastic. Now if we made another, separate instance, we could have two different banana stands, both instances of our blueprint class.

### Methods

##### Instance methods

```ruby
class MyClass
  def some_method
    puts 'something'
  end
end
instance = MyClass.new
instance.some_method
```

##### Class methods

```ruby
class MyClass
  def self.some_method
    puts 'something'
  end
end
MyClass.some_method
```

### Inheritance

##### Defining subclasses

```ruby
class ParentClass
  def a_method
    puts 'b'
  end
end

class SomeClass < ParentClass
  def another_method
    puts 'a'
  end
end

father = ParentClass.new
father.a_method

child = SomeClass.new
child.another_method
child.a_method
```

##### Super

```ruby
class ParentClass
  def a_method
    puts 'b'
  end
end

class SomeClass < ParentClass
  def a_method
    super
    puts 'a'
  end
end

instance = SomeClass.new
instance.a_method
```

### Method Visibility

##### Public (default)

- A public type attribute or method can be accessed from anywhere.

##### Protected

- May be called by any instance of the defining class or its subclasses

##### Private

- May be called only within the context of the calling object. It is never possible to access another object instance's private methods directly, even if the object is of the same class as the caller

```ruby
class Example
  def methodA
  end

  # all methods that follow will be made private
  # --> not accessible for outside objects
  private

  def methodP
  end
end

foo = Example.new
foo.methodP
# => NoMethodError: private method `methodP' called for #<Example:0x007fccfd8576f0>
```

Example:

```ruby
require 'method_locator'
require 'pry'

class Person
  def public_fn
    puts "this is a public function"
  end

  protected

  def protected_fn
    puts "this is protected function"
  end

  private

  def private_fn
    puts "this is private function"
  end
end

class Student < Person
  def test
    begin
      self.protected_fn
      puts "protected works"
    rescue
      puts "protected doesn't work"
    end

    begin
      self.private_fn
      puts "private works"
    rescue
      puts "private doesn't work"
    end

  end
end

Student.new.test

# Student.new.methods_for(:private_fn).each do |method|
#   puts method.owner
# end
```

### Independent Practice (15 minutes)

We're gonna try a little memory exercise. Take 1 minute and make sure what we've done so far is stuck in your memory. Remember the important pieces - we're about to close our computers.

Now, with a marker on the desk, and only from memory, write out a class that defines a student in this room. Think of it first as a blueprint, and then as the actual person. Pick at least one attribute, write a getter & a setter on your desk. Then write out how you'd get & set that attribute beneath it.

When you're done, open up your computer, run it in IRB, and test whether your memory got it all right.

### Resources

- [Wikipedia](http://en.wikibooks.org/wiki/Ruby_Programming/Syntax/Classes)

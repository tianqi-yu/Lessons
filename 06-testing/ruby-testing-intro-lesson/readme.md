# Intro to Testing

### Objectives
*After this lesson, students will be able to:*

- Describe TDD and the benefits it brings
- Explain RSpec
- Write basic test specs to validate attributes working
- Run RSpec to verify your app is working as expected

### Preparation
*Before this lesson, students should already be able to:*

- Run Ruby Scripts
- Explain OOP in Ruby


## What is TDD? What is testing? Intro (15 mins)

#### What is testing?

Testing is the process of making sure your code does what it's supposed to.

Manual testing, or error-driven development, is just what it sounds like: checking all the code works as expected after you change any source code, including testing your application from your web interface. This is limited by the time you need to test *everything* whenever you change *anything*. The larger the code base gets, the harder it is to check every line and every page every time a change is made.

Automated testing is achieved by writing code that checks your code. This may involve writing some code that plays through scenarios that address various possible input values and what the expected outcome is.

When you write very small tests that check very small sections of classes or models, we'd call that "unit" testing.

As your code base grows, so does you test coverage. You should get to a situation where you can run your test code at any time, and every single line of your code gets passed through to ensure it's still returning what you expected it to when it was first written.

Now, you can try to test after you've developed a product, but here are some problems with that approach:

  - Will you have the time?
  - Will your PM let you do this? Or will you have to begin creating the next bit of functionality?

#### What is TDD?

TDD stands for test-driven development. Also called red/green development, in TDD, you write the tests first, before writing any code and then write code that makes the test pass.

The test will initially fail - that's the point of the 'red' - and the expectations of the test will drive how you will write your actual code - this is referred to as your implementation - until the test passes, or goes 'green'.

Frequently, TDD is approached with pair programming - two developers working together at one machine. Often, one person writes a test; then, the other writes the implementation, and they alternate throughout the day. In an interview, you might be given some test code and be asked to write the implementation code; or you might be asked to write the tests for some outline functionality to demonstrate your familiarity with this process.

The process is also referred to as red/green/refactor because once the test passes (and it's "green"), you can review the code you've written and any other parts of the code that's affected to see if it can be cleaned up at all. No new functionality is added at this stage - the desired outcome is still for the tests to pass, just as they had before, but with more efficient code.


<p align="center">
<img src="http://www.pathfindersolns.com/wp-content/uploads/2012/05/red-green-refactorFINAL2.png">
</p>



## Let's write our first test - Codealong (20 mins)

We're going to build a bank account application using TDD. The functionality of our app will include:

- creating a bank
- adding accounts to the bank
- depositing into an account
- withdrawing money from an account


Create a bank_account directory, create a spec directory in it, and install RSpec:

```
gem install rspec
mkdir bank_app
cd bank_app
```

RSpec is a gem that takes a different approach to testing - it allows developers to test user behaviors instead of specific methods but let's write some methods to prove it.  Let's brainstorm and think about what kind of models (classes) do you need for this app?

Maybe we should start with a Bank. Create a `bank.rb` file.

```bash
touch bank.rb
```

There's nothing in this file at the moment. Let's write a test for our bank. To test a file, create a test within within a /spec folder called `bank_spec.rb`.

```bash
mkdir spec
```

Go now let's go and create a blank file called spec_helper.rb inside the spec directory.

```
touch spec/spec_helper.rb
subl .
```

In the `spec_helper.rb` file add the following:

```ruby
RSpec.configure do |config|
  config.color = true
  config.tty = true
  config.formatter = :documentation
end
```

Now, let's create out first test file:

```bash
touch spec/bank_spec.rb
```

Any spec file needs to have access to a `spec_helper` file, so you need to require it. Because it's a file in the same directory, use `require_relative`. You also need to include the file that is being tested. Notice that the file name is preceded by `../` - this means that it is accessing the directory above the one you are currently in.

```ruby
require_relative 'spec_helper'
require_relative '../bank'
```

Now, try to run the test using `rspec spec`:

```bash
rspec spec

No examples found.

Finished in 0.00005 seconds
0 examples, 0 failures
```

Yes! It runs, but we have no tests/code; so it returned no examples with no failures.

#### General structure of a project with RSpec testing

RSpec is a DSL - domain-specific language. This means that it is written specifically for use with Ruby, but is not Ruby.

What are we testing? We want to create a bank. What method would this use? `.new`.

A `describe` at the top of the test is for the class, then another `describe` is for the method being tested. The `it` line is the test:

```ruby
describe Bank do
  describe ".new" do
    it "creates a Bank object" do
    end
  end
end
```

Run the test. We get an error. This is good!

```bash
rspec spec
#.../bank_app/spec/bank_spec.rb:4:in `<top (required)>': uninitialized constant Bank (NameError)...
```

Go into the `bank.rb` file and let's write some implementation code until the error goes away. The solution is to create a class called Bank.

```ruby
class Bank
end
```

What are parameters we will want to include when creating a bank object? A name! Now, we can write some more test code within the existing block:

```ruby
  ...
    it "creates a Bank object" do
      bank = Bank.new('TD Bank')
      expect(bank).to_not eq nil
  ...
```

> Note: Be sure to explain the testing syntax used here.


Run the test again, and it fails with:

```ruby
  ArgumentError:
  wrong number of arguments(1 for 0)
  # ./spec/bank_spec.rb:7:in `initialize'
  # ./spec/bank_spec.rb:7:in `new'
  # ./spec/bank_spec.rb:7:in `block (3 levels) in <top (required)>'
```

This tells you exactly what test was being run, when it broke, and at what line of the test file it failed. The color-coding helps identify failed tests too.

To fix the problem, simply write the minimum amount of code needed to meet the requirements:

```ruby
  def initialize(name)
  end
```

#### Testing for the bank's name

Let's create another test. This tests the name method and expects it to return the name 'TD Bank'.

```ruby
  describe "#name" do
    it "has a name" do
      bank = Bank.new('TD Bank')
      expect(bank.name).to eq 'TD Bank'
    end
  end
```

Remember, there are class methods, like `Person.new`, and instance methods, like `.name`. When you write tests, the naming convention is to use `.class_method` and `#instance_method` in the description.

Now, fix the "undefined method 'name'" error so the bank name test passes.  To make the test pass, you could define your own `name` method, but you can also use `attr_accessor :name`, which creates a getter and setter for you.

```ruby
  class Bank
    attr_accessor :name

    def initialize(name)
      @name = name
    end
  end
```

Run the test again - this passes the test.

#### DRYing up out tests

While doing this, notice that there is repeated code that creates a bank object in all of our tests. Let's 'DRY' this code:

```ruby
describe Bank do
  let(:bank) {Bank.new('TD Bank')}
  ...
```

We can now delete all instances of:

```ruby
bank = Bank.new("TD Bank")
```

Run the test to see if this refactoring of the test works. This is a good protocol to abide by: refactor your code in your tests or your implementations after every cycle of writing tests.


## Write some more tests with us! Codealong (25 mins)

> Note: This code along should be structured differently, the instructor should be asking the students what to write to make the tests pass without providing the answers.

Now let's add a test for creating a bank account with a name and an initial deposit.

```ruby
  describe "#create_account" do
    it "creates an account" do
      bank.create_account('Bob', 200)
      expect(bank.accounts['Bob']).to eql 200
    end
  end
```

Run the test, and look at the error message to see what needs to be done.

```ruby
  1) Bank#create_account create an account
     Failure/Error: bank.create_account('Bob', 200)
     NoMethodError:
       #undefined method `create_account' for #<Bank:0x007fdd4b814270 @name="TD Bank">
```

Now, write the code to make this test pass: create a `create_account` method that takes a name and an initial deposit.

```ruby
    def create_account(account, deposit)
    end
```

Run the test again - notice the error now is about a missing `accounts` method. What is accounts? We know it is a hash because of the brackets in the test. We can fix this, but we need to add an accounts hash; and presumably, when we instantiate a Bank, the hash should be initialized and empty.  This needs another test:

```ruby
  describe '.new' do
    it "creates a Bank object" do
      expect(bank).to_not eq nil
    end
    it "has no accounts" do
      expect(bank.accounts.count).to eq 0
    end
  end
```

This causes two failing tests - but they both complain about the missing `accounts` method.  No biggie:

```ruby
  attr_accessor :name
  attr_reader :accounts

  def initialize(name)
    @name = name
    @accounts = {}
  end
```

And then, fix the new failure by writing the some code to pass the test:

```ruby
  def create_account(account, deposit)
    accounts[account] = deposit
  end
```

Now, we'll write a test to handle a deposit into an account:

```ruby
  describe "#deposit" do
    it "deposits money from client into account" do
      bank.create_account('Bob', 200)
      bank.deposit('Bob', 300)
      expect(bank.accounts['Bob']).to eq 500
    end
  end
```

Write some code to define the deposit method:

```ruby
  def deposit(account, amount)
    accounts[account] = accounts[account] + amount
  end
```

This works, so refactor:

```ruby
  def deposit(account, amount)
    accounts[account] += amount
  end
```

Let's add a feature to check the balance on an account. Start with the test!

```ruby
  describe "#balance" do
    it "returns the balance for the client" do
      bank.create_account('Bob', 200)
      expect(bank.balance('Bob')).to eq 200
    end
  end
```

And write the code:

```ruby
  def balance(account)
    accounts[account]
  end
```

Congratulations! You just created app functionality using TDD!

## Add more tests on your own! Independent Practice (15 mins)

On your own:

1. Add a test for a withdrawal and the code to pass the test.
2. Add one more test to ignore withdrawals that are greater than the account balance and the code to pass.



##Conclusion (15 mins)

> Note: Instructors should review the following solution code with students.

- Add a test for a withdrawal and the code to pass the test.

```ruby

# test
  describe "#withdraw" do
    it "subtracts money from the account" do
      bank.create_account('Bob', 200)
      bank.withdraw('Bob', 50)
      expect(bank.balance('Bob')).to eq 150
    end
  end


# code
  def withdraw(account, amount)
    accounts[account] -= amount
  end
```

- Add one more test to ignore withdrawals that are greater than the account balance and the code to pass.

```ruby

# test
  describe "#withdraw" do
  ...
    it "ignores requests for withdrawals greater than account balance" do
      bank.create_account('Bob', 200)
      bank.withdraw('Bob', 5000)
      expect(bank.balance('Bob')).to eq 200
    end
  end

# code

  def withdraw(account, amount)
    accounts[account] -= amount if amount <= accounts[account]
  end
```

#### One caveat: Is the test always right?

Humans write the tests too, so this is not infallible.

What situations can we anticipate that would make our code misbehave?

- What happens if you try to withdraw more than is in an account?
- What happens if you try to deposit money into a non-existent account?
- Or if you try to withdraw from a non-existent account?

#### Output html

You can generate a easy-to-view html page showing the tests passing with:

```bash
rspec --format html --out rspec_results.html
```

#### Questions:

- What's the word used to start a series of tests ?
- What's the word used to start a test in a series ?
- What is the danger if we write tests after the code ?

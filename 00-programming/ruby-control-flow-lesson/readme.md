![](https://ga-dash.s3.amazonaws.com/production/assets/logo-9f88ae6c9c3871690e33280fcf557f33.png)

# Control Flow in Ruby

### Objectives
- Use conditionals to control logic flow
- Demonstrate using conditionals to run methods
- Differentiate between true, false, truthy, and falsey
- Use boolean logic to combine and manipulate conditionals

### Preparation

*Before this lesson, students should already be able to:*

- Use if/else statements in JS
- Describe what "truthy" & "falsey" mean
- Compare objects in JS to see if they are the same

## If/Else in Ruby - Intro (5 mins)

You've already done a lot of conditional logic & function calling JavaScript - it's time to translate that knowledge over to Ruby.

The concepts are the same, and there are a few nice tricks you can have up your sleeve to make some pretty readable code.

## Simple Cases - Codealong (15 mins)

For an example, let's pretend we have a variable named `heroic`, and we need to run a function named `do_something_heroic` – but only if `heroic` is what it says it is.

**How would we do this in JS?**

```js
var heroic = true;

function do_something_heroic(){
  // some code;
}

if (heroic == true) {
  do_something_heroic();
}
```

Now, let's translate to Ruby.

```ruby
heroic = true

def do_something_heroic
  # some code
end

if heroic == true
  do_something_heroic
end

# same thing, parentheses are optional in Ruby
if(heroic == true)
  do_something_heroic
end
```

Well that seems easy. Just for clarity, these two things are exactly the same when we've got something returning `true`/`false`

```ruby

# totally true and obvious
if heroic == true
  do_something_heroic
end

# exactly the same, but nice shortcut
# leaving it off assumes we mean `heroic == true`
if heroic
  do_something_heroic
end
```

Of course, if we need to do something when it isn't true, we've got good ol' `else`.

```ruby
if heroic
  do_something_heroic
else
  do_something_evil
end
```

But there's a neat shortcut in Ruby for when we only need to use a conditional for one line, or for when we don't need an else. It's called an _inline_ conditional.

```ruby
# totally the same
if heroic
  do_something_heroic
end

# totally the same
do_something_heroic if heroic == true

# totally the same, just shorter!
do_something_heroic if heroic
```

Nice, right? Still easy.

Now what if you're looking to see if something something _isn't_ true? **In english, how do you tell someone to do something if a condition is not true?**

```ruby
heroic = true

# we'll always have opposite-speak, of course
# if heroic tendencies are not noble & true, do something evil
if heroic != true
  do_something_evil
end

# same thing, using bang (!whatever) to inverse what we mean
# do something evil if you're not heroic
do_something_evil if !heroic

# but we've also got 'unless'
# unless you're some heroic weirdo, do something evil, it's more fun
unless heroic
  do_something_evil
end

# oh look, it works inline, too
# do something evil unless you're a heroic weirdo
do_something_evil unless heroic
```

## Truthy & Falsey - Independent Practice (15 mins)

Now, true & false are useful, but you'll more frequently be working with **truthy** and **falsey**.

_Who knows the difference?_

While `true` is a direct boolean that we can assign, **truthy** gives us a boolean from _evaluating something_. Same goes for **falsey**, it comes from some sort of expression that asks the question, _"Does this evaluate to true?"_

In `irb`, take 5 minutes to try conditionals _other_ than `true` and `false`. What happens when:

- What happens when a variable is a string?
- What happens when a variable is a number?
- What happens when one number is bigger than another? Smaller?
- What happens when you're asking if two strings are the same?
- What happens when a variable even exists? One you haven't defined?
- What happens when something's nil?

## Truthy & Falsey - Discussion (10 mins)

Let's talk about what you found out. What did you learn about truthy & falsey & conditionals in Ruby?

## And/or - Codealong (20 minutes)

To wrap it all up, we're gonna need to kick it up a notch - we're gonna talk about _combining_ conditionals, and conditional _fallbacks_.

### && (_and_ operator)

Just like in JS, we can combine conditionals really easily with double ampersands. This tells us _both_ conditions need to be true to go on.

```ruby
delicious = true
healthy = false

if delicious && healthy
  "eat that food"
end

if (delicious == true) && (healthy == false)
  "eat it anyway"
end

# oh look, optional parentheses!
if delicious == true && healthy == false
  "no really, who cares if it's healthy? eat it"
end
```

### || (_or_ operator)

Now how about if you want to try something else when a condition doesn't work? Let's see what we mean:

```ruby
delicious = false
healthy = true

if delicious || healthy
  "eat that food"
end

# mix and match what you've learned!
"eat it" if delicious || healthy

```

### Fun Bonus!
You can actually combine _assigning a variable_ with our || operator for a super useful Ruby shortcut

```ruby
awesome ||= 'this donut'

# same as writing something like
awesome = 'this donut' unless awesome
```

## Conclusion (5 mins)
- Describe the difference between truthy & true.
- What are two ways you could write an if statement? What about an unless statement?
- How do you combine conditionals?
- How do you write an if statement where if the first conditional fails, the second will still work?
---
title: Effective Text Editing with Sublime Text
type: lesson
duration: "1:25"
creator:
    name: Gerry MATHE, Alex Chin, Mike Hopper
    city: London, Atlanta
competencies: Programming, Server Applications
---


# Effective Text Editing with Sublime Text

### Objectives
*After this lesson, students will be able to:*

- Open and describe the components of the Chrome developer tools
- Use the developer tools to manipulate page elements (HTML/CSS)
- Use Package Manager to install and manage essential text editor extensions

### Preparation
*Before this lesson, students should already be able to:*

- Open a text editor
- execute basic commands in the terminal


## Why Another software ?

As developers, we spend a large portion of their time writing computer programs.

#### What are computer programs?

Computer programs are just text files with instructions written in a special syntax i.e. a programming language.

#### How do we create these files?

We create and edit these text files using text editor (e.g. notepad or TextEdit) but there are features and functionality that can be added to text editors that can make our job as developers much easier.

#### IDEs vs Text Editors

IDE: Integrated Development Environment 

An IDE is a program that provide you all the tools you need to create, edit, test and deploy a software project - all in one place. Popular examples of IDEs are: 

- [Netbeans](https://netbeans.org/)
- [Visual Studio](http://www.visualstudio.com/)
- [Eclipse](https://eclipse.org/)
- [RubyMine](https://www.jetbrains.com/ruby/).

#### A hybrid, text-editor designed for programming

Text-editors designed for programming like:

- [Sublime](http://www.sublimetext.com/)
- [TextMate](http://macromates.com/)
- [Atom](https://atom.io/)

Text-editors are much more limited in their scope than IDEs, focussing on the job of helping your write good code. Because of this, you must also be comfortable with the command line.

#### Which is better?

Some programming languages are rarely used outside of an IDE (e.g. Visual Basic). Some developers prefer IDEs, some prefer text-editors. Sometimes a company might ask you to use their tool of choice, sometimes they might let you use whatever your want to. For Ruby and Ruby on Rails it is very common to just use a text editor, although there are IDEs that support Rails. 

#### Start off with the simplest

It is better to learn how to code using just a text editor & command line as this way you learn all the fundamental concepts that a 'magical' IDE can hide from you.

#### Sublime Text 3

Sublime Text is:

- Multi-platform (OS X, Windows, Linux)
- Popular (widely used for web development)
- FREE to try (though you will be nagged to purchase it)
- Extensible (we can add functionality via plugins)

</br>

#### Sublime Text Basics

Sublime will be the software we spend the most time with. Every time you write code, this will be in Sublime.

#### Use subl from command line

Open up Sublime from  the terminal

```
subl
``` 

To open Sublime with a specific file, we can use the command line again,
but this time passing in a file name:

```
mkdir recipes
subl recipes/veggie_soup.txt
```



#### Open sublime in Project mode

Real-world software projects often involve _many_ files organised into
folders. It is handy to be able to see all the files in our project when
working in our text editor. Sublime makes this easy as it supports a
project mode. To use this we simply pass a directory instead of a file:

```
subl recipes
```
or...

```
cd recipes
subl .
```

Notice that the sidebar now has a folders section that shows all the files
and folders in the project. Clicking on a folder expands the view to show its
contents.



#### Settings and themes

```
cmd + , 
```

Allows you to access the sublime's user preferences.

It opens this file as a JSON object (we will learn all about JSON in the next few weeks). 

It basically presents the settings as a series of keys and values - you can add keys/values, and/or modify the existing values to fit your personal preferences.

You can see all of the choices of configuration by going to:

```
Sublime Text > Preferences > Settings - Default
```

It's best not to edit the defaults; rather, copy keys into your user settings and set their value there.

We can change the colour scheme sublime uses by going to: 

```
Sublime Text > Preferences > Color Scheme
```
    
and selecting one ("dawn" is a good recommendation). When you select a scheme it changes all the syntax highlighting colours.


#### Find / find and replace

```
Cmd + f
```

A text input should appear at the bottom of the window, giving you the option of finding text in the current document.

```
Cmd + alt + g
```

brings you to the next occurrence of the word you're searching for

```
Cmd + shift + g
```
    
does the same, but brings you to the previous occurrence

``` 
Cmd + alt + f
```
    
brings you to the search and replace menu

```
Cmd + shift + f
```
    
the window at the bottom should appear with 3 inputs: one for the word to find, one for the path, one for the replace value. If you type `<project>` inside the "path" text input, the search will only be executed within the scope of the current project.

```
Cmd + d
```
    
Will select multiple occurances of the next word (very useful).

#### Cursor tricks

```
Alt + drag
```

Put the cursor before the first character, press "Alt" and drag the cursor at the end the paragraph -> will allow you to enter text before all of the selected lines

```
Cmd + cursor click
```
    
Will set multiple blinking cursors on your file, allowing you to edit multiple elements at once. 

There are several other ways to use your cursor with combinations of "Alt", "Cmd" and "Shift", allowing you to become more productive as you go. 

See [gist.github.com/lucasfais/1207002](https://gist.github.com/lucasfais/1207002) for more examples. Try out a few! 

#### Custom Key Bindings

If you take a look at:

```
Sublime Text > Preferences > Key Bindings - User
```

(Again, you don't want to change the defaults!)

These are custom key shortcuts that we have setup for you. A very useful one is 

```
Cmd + shift + r 
```
    
Which will auto-indent your code.

#### Shortcuts to open Sublime

In terminal: 

```
$ cd ~/Desktop
$ mkdir test
$ cd test
$ touch file1.txt
$ subl file1.txt
```

Will open file 1 in Sublime.

``` 
subl .
```
    
Will open current directory in Sublime. 

#### More Shortcuts

These were just some shortcuts in Sublime. Here are a few more:

- [Keyboard Shortcuts](https://gist.github.com/alexpchin/1ad0929913ed6ac1876c)

Keypress          |  Action
------------------|--------- 
cmd + s           |  save changes in current file - DO IT OFTEN!!!
cmd + q           |  close Sublime
cmd + w           |  close one file at a time
cmd + alt + arrow |  switch between files
cmd + numbers     |  also switch between specific files
cmd + f           |  search in you current file
cmd + shift + f   |  search the entire project
cmd + d           |  go to next searched word in file
ctrl + cmd + g    |  selects all searched words in your file.
cmd + w           |  close each window at a time
cmd + shift + p   |  take us to a command palette where we will be given menu options without leaving our keyboard.
cmd + p           |  open the file finder
cmd + 1..0        |  highlight the corresponding tab
cmd + p :NUMBER   |  put the cursor at line number NUMBER
cmd + ,           |  open the preferences
cmd + backspace   |  remove the line before your cursor
cmd + right/left  |  moves your cursor to the end/beginning of the line

<br>





## Independent Practice (20 minutes)

> ***Note:*** _This can be a pair programming activity or done independently._

In this code along we will create some files via the command line and then
edit them in Sublime.

Open the starter code and follow the instructions that start with a `#` sign to make modifications to the text in the following files.

* eggs_and_ham.txt
* fruit.txt
* superheroes.txt
* math.txt

## Conclusion (5 mins)

* [Efficiency With Sublime Text](http://thunderboltlabs.com/blog/2013/11/19/efficiency-with-sublime-text-and-ruby/)
* [Sublime Text Keyboard Shortcuts](http://www.wdtutorials.com/2013/06/23/sublime-text-keyboard-shortcuts-cheat-sheet-win-os-x-and-linux#.VT2F161Viko)
* [Sublime Practice](https://www.shortcutfoo.com/app/dojos/sublime-text-2-mac)
- [5 things you didn't know sublime text 2 could do](http://www.creativebloq.com/design/5-things-you-didnt-know-sublime-text-2-could-do-1132849)
- [Essential sublime text 2 plugins and extensions](http://net.tutsplus.com/tutorials/tools-and-tips/essential-sublime-text-2-plugins-and-extensions/)
![](https://ga-dash.s3.amazonaws.com/production/assets/logo-9f88ae6c9c3871690e33280fcf557f33.png)
# WDI installFest!

#### Before you start…
- Below are a bunch of commands to enter into Terminal, which is a way of interacting with your computer that doesn’t use the fancy desktop interface you’re used to.
- You should be able to copy and paste the lines into Terminal — except for a few that have obvious prompts in them, like “YOUR NAME”, which you should replace accordingly.
- The lines below all start with `$`, **but you shouldn’t actually write the** `$`. Its purpose is just to make the starts of lines easy to see in these instructions.

#### Sign up Slack
- Complete the “sign up” steps at www.slack.com
- Write your Slack username on the whiteboard.

#### Sign up Github
- Complete the “sign up” steps at www.github.com
- Write your Github username on the whiteboard.

#### Terminal
- Open `Applications > Utilities > Terminal`
or
- Go to “spotlight search” with `command + space`
- Search for `terminal`

#### iTerm2
- Go to http://iterm2.com/
- iTerm2 is a replacement for Terminal and the successor to iTerm. It works on Macs with OS 10.5 (Leopard) or newer. iTerm2 brings the terminal into the modern age with features you never knew you always wanted.

#### Oh My Zsh
- Go to https://github.com/robbyrussell/oh-my-zsh
- Oh My Zsh is an open source, community-driven framework for managing your zsh configuration.
- Oh My Zsh is installed by running one of the following commands in your terminal. You can install this via the command-line with either curl or wget.
- via curl (what’s curl? cURL is a computer software project providing a library and command-line tool for transferring data using various protocols.)
```
curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh
```

#### Xcode
##### Install Xcode
Go to `https://developer.apple.com/xcode/downloads/`

##### Xcode CLI tools
```
$ xcode-select —install
```

#### Learning ShortCuts
##### CheatSheet
- Download and install: http://www.mediaatelier.com/CheatSheet/
- Hold on to `Command` for 3 seconds on **any** Application for a list of shortcuts

#### Text Editor | Sublime 3
- Download and install: http://www.sublimetext.com/3
- Creating a symlink to the Application from the terminal
- In `~/.zshrc`, Add `alias subl="open -a 'Sublime Text'"`

#### Homebrew (OSX’s Package Manager)
- Go to http://brew.sh/
- Package manager on Mac OS X
- To install Homebrew, paste the following at a Terminal prompt
```
$ ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
$ brew update && brew upgrade
$ echo 'export PATH="/usr/local/bin:$PATH"' >> ~/.zshrc
```
- The output of `$ which brew` is `/usr/local/bin/brew`. The output of `$ brew doctor` is ready to brew.
- Homebrew installs the stuff you need that Apple didn’t.
```
$ brew install <package-name>
```

#### Git
- Git is a tool for **version control**. Version control is a system that records changes to a file or set of files over time so that you can recall specific versions later.
```
$ brew install git
```
- You know it worked if…the output of `git —version` is greater than or equal to `2.5.3`

##### Configure Git
```
$ git config -—global user.name  “YOUR NAME”
$ git config —-global user.email “YOUR@EMAIL.COM”
```

##### Tell git what editor to use for commits
- For Sublime
`$ git config —-global core.editor "subl —wait —new-window"`

#### RBENV (Ruby Version Manager)
- Install RBENV
```
$ brew update
$ brew install rbenv ruby-build
```
- Afterwards, do
```
$ echo 'eval "$(rbenv init -)"' >> ~/.zshrc
```
and run the following to update the terminal
```
$ source ~/.zshrc
```

#### Ruby v2.2.3
- To install the latest stable version of Ruby, run the following
```
$ rbenv install 2.2.3
```
- Set the Ruby version to 2.2.3 throughout the user
```
$ rbenv global 2.2.3
```

- Check if it works by running `$ ruby -v`, you should see `ruby 2.2.3`

- You can list all available Ruby versions here:
```
$ rbenv install -l
```

#### Rails
- Install the latest rails (4.2.4)
```
$ gem install rails -v 4.2.4
```

- Note: if it asks you to use `sudo gem install <package>`, please run
```
$ sudo chown -R your-username ~/.rbenv
$ sudo chown -R your-username ~/.gem
```

You can check your username with `$ whoami`.

- Check if it works:
```
$ rails -v
rails 4.2.4
```

#### Sign up Heroku
- Complete the “sign up” steps at www.Heroku.com
- Write your Heroku username on the whiteboard.

#### Heroku Toolbelt
- Download the [Heroku CLI](https://toolbelt.heroku.com)
- Make sure you have it installed by running

```
$ heroku login

Enter your Heroku credentials.
Email: fer@ga.co
Password (typing will be hidden):
Authentication successful.
```

#### Sign up AWS
- Complete the “sign up” steps at http://aws.amazon.com/

#### Add your user information for different sites here:
- https://docs.google.com/spreadsheets/d/14_tEPo2gGLe6K7FyWRoa0MqjO1HkxNNynU8VHvsDacY/edit#gid=0

## Instructors
- [CheatSheet](http://www.macupdate.com/app/mac/43222/cheatsheet) - Show shortcut keys for most applications by holding the `Command` key
- [KeyCastr](https://github.com/keycastr/keycastr) - Display a little window that shows what keys you are typing
- [Spectacle](https://www.spectacleapp.com) - Allows your to manage windows like a boss

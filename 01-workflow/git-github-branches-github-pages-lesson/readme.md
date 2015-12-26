![](https://ga-dash.s3.amazonaws.com/production/assets/logo-9f88ae6c9c3871690e33280fcf557f33.png)

# Git Branches and Github Pages Deployment

### Objectives
- Create, merge and delete branches on local and remote repositories
- Deploy a project to Github Pages
- Describe how branching and merging allows for collaboration during development

### Preparation

- Use basic git commands – init, add, commit, checkout

## Git Branching - Intro (10 mins)

Since you guys learned about git earlier this week, it's time to start showing you how developers actually use it. We're going to talk about branching today, and you're going to see a very clever way that git lets us work on our code, keep a history of everything we do, and not screw up what we already have.

#### So what is branching?

Think of making a new branch like spinning up an alternate universe to play with. Each branch exists like a parallel dimension, side by side, for you to hack on.

[![git branching](https://www.atlassian.com/git/images/tutorials/collaborating/using-branches/01.svg)](https://www.atlassian.com/git/tutorials/using-branches/git-branch)

You create a branch anytime you want to work on a new feature, fix a bug, or refactor some code. Any changes you make in a branch stay on that branch, so it won't ruin any other versions you have sitting in other branches.

## Creating a Branch - Demo (25 mins)

By default, as soon as you make your first commit, you have and are on a `master` branch, and that's where your most production-ready, least experimental code lives.

Any time you're tasked with building a new feature, you make a branch named something obvious, switch to it, write some code, and then eventually merge it into master. Hopefully after someone's double-checked your work.

But let's see what this all looks like from scratch. Just watch and absorb for now, you'll practice it in a minute.

#### The normal git init process

We're working with a dummy repo just for an example.

```bash
$ mkdir branching-is-awesome
$ cd branching-is-awesome/
$ git init
$ touch readme.md
$ git add -A
$ git commit -am 'initializes repository with an empty readme'
```

#### Suddenly, a new feature!

Now, let's say we have a feature we're about to work on. Something simple for now - let's say we want someone to know what this project is all about if they find it on Github, so we should make a readme.

Writing a readme. **That's a new feature, so we should make a new branch.**

```bash
$ git branch writing-our-readme
```

Git created it, but let's double check by listing all our branches:

```bash
$ git branch
  writing-our-readme
* master
```

Nice. The `*` tells us which one we're on (your terminal may or may not color it differently, too), and we see from the list of all our branches we have a new one. Let's switch to it so we can change some stuff without affecting `master`.

```bash
$ git checkout writing-our-readme
Switched to branch 'writing-our-readme'
```

Nice. `git checkout` is a beautiful command – you can use it to check out an old piece of history, another branch, even a specific file or a folder from an old piece of history _on_ another branch.

Now we're working in alternate universe. We can make whatever changes we need. Let's pretend we filled that sucker up with the best readme you've ever read. Obviously we should save our history with a commit, but we're still on our `writing-our-readme` branch, that hasn't changed.

```
$ git add -A
$ git commit -am 'adds incredible writing to readme'
```

#### Seeing the effects

You can really start to see this idea of parallel universes once you have a commit like this in a branch.

When we switch back and forth, like so:
```bash
$ git checkout master
$ git checkout writing-our-readme
# etc etc
```

We can actually see the changes:

<img width="740" alt="branch-readmes" src="https://cloud.githubusercontent.com/assets/25366/9808262/8bef4ffc-5812-11e5-817a-60571f97deea.png">


- On `master`, `readme.md` has no text in it.
- On `writing-our-readme`, `readme.md` is full of text.

You can literally switch between those branches in your terminal, switch back to your text editor, and see the text appear and disappear. Because in one universe, the text exists, and in another it doesn't.

### Finally, we merge

The very last step of this process is to _merge_ your changes from one branch back into your master. In a few weeks, when you work on your group projects, we'll show you how to use Github to merge changes in a more collaborative, central way.

But before Github existed, when you're working on a solo project, or maybe just because you love Terminal, let's look at how to merge your own branches back into your production-ready `master`.

We've gone through the whole process – you're starting a new feature, so you make a new branch, make a bunch of commits on that branch as you work on it, and now you're satisfied it's ready to ship.

You navigate to the branch you want to merge into – most often `master`, but it could be any branch.

```
$ git checkout master
```

And you simply tell it to `merge`:

```
$ git merge writing-our-readme
Updating 5da20b7..62b3656
Fast-forward
 readme.md | 7 +++++++
 1 file changed, 7 insertions(+)
```

This analyzes all the changes you've made on your feature branch, brings them into your `master` branch, and commits them to `master`.

And now that your `master` looks just like your `writing-our-readme` branch, you can delete it.

```
$ git branch -d writing-our-readme
Deleted branch writing-our-readme (was 62b3656).
```

Don't worry – just like most things in git, it's not gone forever. You could always checkout the last piece of history before you deleted the branch, and your branch would be there. Consider that timehopping to the past, where in the present it's gone and you don't need it.

Your most recent code ready to ship is in `master`, and you're a flipping pro.


#### Pushing Branches

One last thing.

Since you're getting to be experts with Github, you should know you can store branches on Github, too, not just your local git repo. While this will totally come into play on your group projects in a different way, it might be useful to you now for the simple purpose of backing up your work.

Maybe you're in the middle of a feature or a bug fix and you're just not done, but it's time for bed. Make your commits, of course, but if you've set up your repo to connect with Github, you can easily push your branch up there.

While you've seen this:

```
$ git push origin master
```

What you should know is that `origin` is simply an alias. We _could_ call it `github` if we wanted, or `zebra` or `fnarf` or `bagel`. It would then be:

```
$ git push zebra master
```

And you've now learned that `master` is just your special, default, production-ready branch. So, assuming you're using the default alias of `origin` (and not `zebra`), guess how you push a branch?

```
$ git push origin my-new-but-unfinished-feature-branch
```

You can `push` and `pull` those branches easily to save your work up in the cloud.

> "Real programmers don't edit `master`." – Dave, the Programmer

## Practice thinking in "branches" - Discussion (5 minutes)

Team up with the person next to you, and go through the following commands we've reviewed in class.

- git add
- git commit
- git branch
- git checkout
- git merge

Based on what we've talked about, and before you jump into your terminal, discuss the correct commands you would have to use - and the correct order you would need to use them in - to repeat the process of creating a readme. Be aware of the "why" and that you may have to use some commands more than once.

## Branch, Push, Merge, Repeat - Independent Practice (20 mins)

Time for you to try it. With your partner, walk through the steps necessary together, catching each other if either makes any missteps.

Start by mimicking our example – create a branch to write another readme.

- `git init`
- `git add` & `git commit`
- Create a new branch for the feature you're about to work on
- Switch to that branch
- Write some code
- `git merge` that branch back into your `master`

Once you've got it down, do the same process again for a bug fix (aka a typo), so you get in the habit of creating branches whenever you need to make changes.

## GitHub pages - Demo (5 mins)

Now that you have had some good practice at branching and merging it's time to deploy using GitHub pages.

We strongly encourage checking out the official [docs](https://pages.github.com/) and practice more at home.

It's _super_ easy and - basically - all that needs to happen is the creation of a new branch called `gh-pages`.

From our readme project:

```bash
git branch gh-pages
git checkout gh-pages
```

As long as there is an index.html in your root directory of your gh-pages branch...

```bash
echo "<h1> GitHub pages! </h1>" >> index.html
```

...you'll be able to navigate to http://YOURUSERNAME.github.io/REPOSITORYNAME to view the rendered html. You can also point a new domain name to this URL; this would give you a fully deployed project with a custom URL.


## Conclusion (5 mins)
- What's a branch in git? When do you use it?
- How do you create a branch?
- How do you switch between branches?
- How do you merge & delete a branch?

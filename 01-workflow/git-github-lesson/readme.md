![](https://ga-dash.s3.amazonaws.com/production/assets/logo-9f88ae6c9c3871690e33280fcf557f33.png)

# Git and Github intro

### Objectives
*After this lesson, students will be able to:*

- Explain basic git commands like init, add, commit, push, pull and clone
- Distinguish between local and remote repositories
- Create, copy, and delete repositories locally, or on Github
- Fork and clone remote repositories


### Preparation
*Before this lesson, students should already be able to:*

- Use the command line
- Use a text editor

## Git vs GitHub and version control - Intro (20 mins)


First things first - Git is not Github. This is a common mistake that people make.


#### What is Git?

[Git](https://git-scm.com/) is:

- A program you run from the command line
- A distributed version control system

Programmers use Git so that they can keep the history of all the changes to their code. This means that they can rollback changes (or switch to older versions) as far back int time as they started using Git on their project.

A codebase in Git is referred to as a **repository**, or **repo**, for short.

Git was created by [Linus Torvalds](https://en.wikipedia.org/wiki/Linus_Torvalds), the principal developer of Linux.

#### What is Github?

[Github](https://github.com/) is:

- A hosting service for Git repositories
- A web interface to explore Git repositories
- A social network of programmers
- We all have individual accounts and put our codebases on our Github account
- You can follow users and star your favorite projects
- Developers can access codebases on other public accounts
- GitHub uses Git

#### Can you use git without Github?

Think about this quote: “Git is software. GitHub is company that happens to use Git software.”  So yes, you can certainly use Git without GitHub!


#### What is version control?

Version control is a kind of software used to record and re-use changes (or versions) on files so that an history of the file content can be reviewed.

There are two main types of version control:

- Centralized
- Distributed

#### Centralized Version Control

Centralized version control (CVCs) has one central repository that is shared among all team members.

![Centralized Version Control](http://s17.postimg.org/3s9fr8zxr/figure1.png)


Schema from [IBM Developer works](http://www.ibm.com/developerworks/library/d-app-centric-ops/)


The main concept of a centralized system is that it works in a client and server relationship. The repository is located in one place and provides access to many clients. It’s very similar to FTP in where you have an FTP client which connects to an FTP server. All changes, users, versions of your project and information must be sent and received from this central repository.

The primary benefits of a Centralized Version Control is:

- It is easy to understand
- You have more control over users and access (since it is served from one place)
- Simple to get started

At the same time, Subversion has some drawbacks:

- Dependent on access to the server (requires internet connection)
- Hard to manage a server and backups
- It can be slower because every command connects to the server
- Branching and merging tools are difficult to use

Popular centralized version control systems (CVCSes) include:

- [Subversion](http://subversion.apache.org/)
- CVS

#### Distributed Version Control

Distributed version control systems are a newer option. In distributed version control, each user has their own copy of the entire repository, not just the files but the history as well. Think of it as a network of individual repositories.

![Distributed Version Control](http://s17.postimg.org/3tjdko1rj/figure2.png)

Schema from [IBM Developer works](http://www.ibm.com/developerworks/library/d-app-centric-ops/)

The primary benefits of a Distributed Version Control is:

- More powerful and detailed change tracking, which means less conflicts
- No server necessary – all actions except sharing repositories are local (commit offline)
- Branching and merging is more reliable, and therefore used more often
- It’s fast

At the same time, Distributed Version Control do have some drawbacks:

- The distributed model is harder to understand
- The revisions are not incremental numbers, which make them harder to reference
- It can be easier to make mistakes until you are familiar with the model

Popular distributed version control systems include:

- [Git](http://git-scm.com/)
- [mercurial](http://www.selenic.com/mercurial/wiki/index.cgi/ProjectsUsingMercurial)
- [bzr](http://wiki.bazaar.canonical.com/WhoUsesBzr)
- [fossil](http://www.fossil-scm.org/)


## Why is Git tricky to understand? Demo (10 mins)

Git is tricky to understand because describing 'how' it works would require the use of strange and technical-sounding words like:

- [Directed acyclic graph](https://en.wikipedia.org/wiki/Directed_acyclic_graph)
- [SHA-1](https://en.wikipedia.org/wiki/SHA-1)
- blob
- tree

However, you don't actually need to know how it works under the hood in order to use it.

#### Trees?!

Even though you don't need to know how they work, it is useful to know that your local repository consists of three "trees" maintained by Git.

- **Working Directory**: which holds the actual files.
- **Index**: which acts as a staging area
- **HEAD**: which points to the last commit you've made.

![workflow](https://cloud.githubusercontent.com/assets/40461/8221736/f1f7e972-1559-11e5-9dcb-66b44139ee6f.png)

#### So many commands?!

There are also a lot of commands you can use in git. You can take a look at a list of the available commands by running:

```bash
$ git help -a
```

Even though there are lots of commands, on the course we will really only need about 10.


#### Git File Lifecycle

To understand how Git works, we need to talk about the lifecycle of a Git-tracked file.

![lifecycle](https://cloud.githubusercontent.com/assets/40461/8226866/62730b4c-159a-11e5-89cd-20b72ed1de45.png)

Schema From [git-scm.com](https://git-scm.com/book/en/v2/Git-Basics-Recording-Changes-to-the-Repository)

There are 4 main stages of Git version controlled file:

1. **Untracked**: The file will not be added in the next commit
2. **Staged**: Staged files have not yet been committed to memory but they are "on deck" so to speak for your next commit
3. **Unmodified**: The file has already been committed and has not changed since the last commit
4. **Modified**: You have changes in the file since it was last committed, you will need to stage them again for the changes to be added in the next commit

Once you have committed a file and it becomes "unmodified" then it's contents are saved in Git's memory.

- **Not saved in git memory**: Your file is not saved until you commit the file to Git's memory
- **Saved in git memory**: Only once you have committed a file, it becomes saved in Git's memory


## Let's use Git - Codealong (15 mins)

First, create a directory on your Desktop:

```bash
$ cd ~/Desktop
$ mkdir hello-world
```

You can place this directory under Git revision control using the command:

```bash
$ git init
```

Git will reply:

```bash
Initialized empty Git repository in <location>
```

You've now initialized the working directory.

#### The .git folder

If we look at the contents of this empty folder using:

```bash
ls -A
```

We should see that there is now a hidden folder called `.git` this is where all of the information about your repository is stored. There is no need for you to make any changes to this folder. You can control all the git flow using `git` commands.

#### Add a file

Let's create a new file:

```bash
$ touch a.txt
```

A small cross should show next to your prompt!

```bash
git:(master) ✗
```

If we run `git status` we should get:

```bash
On branch master

Initial commit

Untracked files:
  (use "git add <file>..." to include in what will be committed)

	a.txt

nothing added to commit but untracked files present (use "git add" to track)
```

This means that there is a new **untracked** file. Next, tell Git to take a snapshot of the contents of all files under the current directory (note the .)

```bash
$ git add .
```

This snapshot is now stored in a temporary staging area which Git calls the "index".

#### Commit

To permanently store the contents of the index in the repository, (commit these changes to the HEAD), you need to run:

```bash
$ git commit -m "Please remember this file at this time"
```

You should now get:

```bash
[master (root-commit) b4faebd] Please remember this file at this time
 1 file changed, 0 insertions(+), 0 deletions(-)
 create mode 100644 a.txt
```

#### Checking the log

If we want to view the commit history, we can run:

```bash
git log
```

You should see:

```bash
* b4faebd (HEAD, master) Please remember this file at this time
```

To exit this view, you need to press:

```bash
q
```

#### Make changes to the file

Now let's open a.txt in Sublime:

```bash
$ subl a.txt
```

Inside the file, write something.

If you press `return` in the terminal, you will now see that you have untracked changes.

Running `git status` again will show you that a.txt has been **modified**.

#### Revert to a previous commit

Let's now make a second commit.

```bash
$ git add .
$ git commit -m "Second commit"
```

Checking `git log` will show you 2 commits with different ids:

```bash
* 6e78569 (HEAD, master) Second commit
* b4faebd Please remember this file at this time
```

We can revert the file back to the first commit using it's specific commit id with:

```bash
$ git reset --soft b4faebd
```

This will do a soft reset, where the changes in the file we made are still there - the changes are staged but not committed anymore.

If we want to revert the file back and disregard any changes (dangerous!), we can use:

```bash
$ git reset --hard b4faebd
```

#### Making and cloning repositories - Codealong (10 mins)

Let's do this together:

1. Go to your Github account
2. In the top left, hit the + button and select `New repository`
![](https://help.github.com/assets/images/help/repository/repo-create.png)
3. Name your repository `hello-world`
![](https://help.github.com/assets/images/help/repository/repo-create-name.png)
4. **Initialize this repository with a README** (So that we can `git pull`)
4. Click the big green Create Repository button

We now need to connect our local Git repo with our remote repository on GitHub. We have to add a "remote" repository, an address where we can send our local files to be stored.

```bash
git remote add origin git@github.com:github-name/hello-world.git
```

#### Pushing to Github

In order to send files from our local machine to our remote repository on Github, we need to use the command `git push`. However, you also need to add the name of the remote, in this case we called it `origin` and the name of the branch, in this case `master`.

```bash
git push origin master
```

This should fail due to new files on the remote repo.

#### Pulling from Github

As we added the README.md in our repo, we need to first `pull` that file to our local repository to check that we haven't got a 'conflict'.

```bash
git pull origin master
```

Once we have done this, you should see the README file on your computer. Now you can push your changes:

```bash
git push origin master
```

Refresh your GitHub webpage, and the files should be there.


#### Cloning your first repository

Now that everyone has their first repository on GitHub, let's clone our first repository!

Cloning allows you to get a local copy of a remote repository.

Navigate back to your Desktop and **delete your hello-world repository**:

```bash
cd ~/Desktop
rm -rf hello-world
```

Now ask the person sitting next to you for their github name and navigate to their repository on github:

```bash
https://www.github.com/<github-username>/hello-world
```

On the right hand side you will see:

![clone](https://cloud.githubusercontent.com/assets/40461/8228838/dfdc57a0-15a9-11e5-90a7-6c4fa8641ae6.jpg)

Ensure that you have SSH checked and copy this url.

#### Clone their repo!

To retrieve the contents of their repo, all you need to do is:

```bash
$ git clone git@github.com:alexpchin/hello-world.git
```

Git should reply:

```bash
Cloning into 'hello-world'...
remote: Counting objects: 3, done.
remote: Total 3 (delta 0), reused 3 (delta 0), pack-reused 0
Receiving objects: 100% (3/3), done.
Checking connectivity... done.
```

You now have cloned your first repository!


## What is forking? Intro (5 mins)

The `fork` & `pull` model lets anyone fork an existing repository and push changes to their personal fork without requiring access be granted to the source repository.

Most commonly, forks are used to either propose changes to someone else's project or to use someone else's project as a starting point for your own idea.

#### Cloning vs Forking

When you fork a repository, you make a new **remote** repository that is exactly the same as the original, except you are the owner. You can then `clone` your new fork and `push` and `pull` to it without needing any special permissions.

When you clone a repository, unless you have been added as a contributor, you will not be able to push your changes to the original remote repository.

#### Pull requests

When you want to propose a change to a repository (the original project) that you have forked, you can issue a pull request. This basically is you saying:

_"I've made some changes to your repository, if you want to include them in your original one then you can pull them from my fork!"_


## Create a pull request on GitHub - Codealong (5 mins)

Before you can open a pull request, you must create a branch in your local repository, commit to it, and push the branch to a repository or fork on GitHub.

1. Visit the repository you pushed to
2. Click the "Compare, review, create a pull request" button in the repository ![pr](https://cloud.githubusercontent.com/assets/40461/8229344/d344aa8e-15ad-11e5-8578-08893bcee335.jpg)

3. You'll land right onto the compare page - you can click Edit at the top to pick a new branch to merge in, using the Head Branch dropdown.
4. Select the target branch your branch should be merged to, using the Base Branch dropdown
5. Review your proposed change
6. Click "Click to create a pull request" for this comparison
7. Enter a title and description for your pull request
8. Click 'Send pull request'

## Assess - Independent Practice (10 mins)

Use the internet and what you've learned today to answer the following questions with a partner:

* How do I send changes to the staging area?
* How do I check what is going to be committed?
* How do I send the commits to Github?
* How do I go back to the previous commit?
* How do I check the configuration on a specific machine?
* How does github know that I am allowed to push to a specific repo?

## Conclusion (5 mins)

As a developer, you'll have to use Git pretty much everyday, the learning curve is steep and all the principles of version control can  be a bit blurry sometimes, hence why we ask students to push their homework everyday and to commit regularly during project time.

Don't be frustrated by all the new commands because we will definitely have the time to practice during this course.

- Explain the difference between forking and cloning.
- Describe the steps to initialize a Git repository and link your local repository to a GitHub remote location.

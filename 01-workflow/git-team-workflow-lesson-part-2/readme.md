#Git Team Workflow Part 2

### Objectives
*After this lesson, students will be able to:*
- Use branches to isolate changes tied to specific features
- Efficiently and correctly resolve merge conflicts
- Fetch changes from a remote without merging them into your own
- Explain how rebase combines two branches

### Prerequisites
*Before this lesson, students should already be able to:*
- Use Git/GitHub to fork, clone, push and pull
- Read through the following:
  1. https://www.atlassian.com/git/tutorials/using-branches
  2. https://www.atlassian.com/git/tutorials/comparing-workflows
  3. https://www.atlassian.com/git/tutorials/merging-vs-rebasing ('Conceptual Overiew' section)
  4. http://nvie.com/posts/a-successful-git-branching-model/

> ***Note:*** _This can be a pair programming activity or done independently._  Also, this lab builds on the [git-team-workflow-lesson](../git-team-workflow-lesson) and picks up where that lesson left off.

## Resolving Merge Conflicts - Intro (10 mins)

And we're back!  Last we checked, you and your partner were working on the same project, merged in some work you did on the models of your new IMDB app, but both decided to work on the controllers at the same time on different branches!

<p align="center">
<img src='http://s16.postimg.org/fu91r8z05/Screen_Shot_2015_07_29_at_4_49_01_PM.png'>
</p>

Submit a pull request for student 1 and merge student 1's pull request. Then, try to create a pull request for student 2's work:

<p align='center'>
<img src='http://s2.postimg.org/p7md53bqx/Screen_Shot_2015_07_29_at_7_34_00_PM.png'>
</p>

Oh no! We're unable to merge this in because student 1 and student 2 worked on the same files and now we have different versions of the files we're trying to combine.  Let's create pull request anyway and sort this out.

## `fetch`, `checkout`, `merge` from the command line - Codealong (15 mins)

Remember when we said GitHub is really helpful - check it out:

<p align='center'>
<img src='http://s30.postimg.org/h29s5ii5d/Screen_Shot_2015_07_29_at_7_38_37_PM.png'>
</p>

Simply follow the directions to make this work!

```bash
git fetch origin
git checkout -b student2-controller origin/student2-controller
git merge master
```

> Note: Explain line by line what this is doing.

In the simplest terms, `git pull` is just like running `git fetch` followed by `git merge`:

_"When you fetch, Git gathers any commits from the target branch that do not exist in your current branch and stores them in your local repository. However, it does not merge them with your current branch. This is particularly useful if you need to keep your repository up to date, but are working on something that might break if you update your files. To integrate the commits into your master branch, you use merge."_ - StackOverflow.com

```bash
Auto-merging app/controllers/movies_controller.rb
CONFLICT (content): Merge conflict in app/controllers/movies_controller.rb
Auto-merging app/controllers/actors_controller.rb
CONFLICT (content): Merge conflict in app/controllers/actors_controller.rb
Automatic merge failed; fix conflicts and then commit the result.
```

## Resolve your Merge Conflict - Independent Practice (15 mins)

Now, since we hit a merge conflict, with your partner use the message to resolve the conflicts. Git will mark the conflicts in the working tree for us - our terminal showed us problems in the movies and actors controllers - so open the files being identified with your text editor, edit the files by choosing which version you want to keep - delete all the "extra stuff" (`<<<<<<<`, `=======`, HEAD, master) just like we practiced earlier - and then...

```bash
git add .
git commit -m 'your message'
git checkout master
git merge --no-ff student2-controller
git push origin master
```

...now, try `rake db:seed`, spin up a server, and you should get:

<p align="center">
<img src="http://i.imgur.com/Fqun13q.png"
</p>

## Rebasing - Intro (15 mins)

While merging represents one path for combining different branches, there is another common path called `rebase`. Rebasing works differently than merging. Rather than combining the finished data from two different branches via a single commit, it combines the two branches _themselves_, rearranging them and, effectively, re-writing history.

Here's what a rebase looks like. Suppose we have two branches, like this.

![Rebasing - Separate Branches](http://i.share.pho.to/a575aa3c_o.png)

One day, someone makes a commit onto the `master` branch. We want to include those changes into our feature branch, so that our code doesn't conflict with theirs.

![Rebasing - Master is Ahead](http://i.share.pho.to/d51482ca_o.png)

From our feature branch, if we run the command `git rebase master`, we can tell git to rewrite the history of our feature branch as if the new commit on `master` had __always been there__.

![Rebasing - In Action](http://i.share.pho.to/a44011e7_o.png)

Rebase is extremely useful for cleaning up your commit history, but it also carries risk; when you rebase, you are in fact discarding your old commits and replacing them with new (though admittedly, similar) commits, and this can seriously screw up a collaborator if you're working in a shared repo.The golden rule for `git rebase` is "Only rebase **before** sharing your code, **never** after."

Like `git merge`, `git rebase` also sometimes runs into merge conflicts that need to be resolved. The procedure for doing this is almost the same; once you fix the conflicts, run `git rebase --continue` to complete the rebase.


## Team Workflows - Discussion (20 mins)

So far, we've only talked about Rebase in the context of working alone. Here are a few examples of workflows - using both rebase and merge - that might get used in the field.

#### Single-Remote Workflows
One thing all of these approaches have in common is the necessity of staying on top of changes to a single shared repository. This is usually accomplished by running `git fetch`, which pulls updates from origin, and merging those updates; alternatively, you could use `git pull` to do both at once.

#### Centralized Workflow
**How It Works**: The remote repo has one single branch on it, `master`. All collaborators have separate clones of this repo. They can each work independently on separate things. However, before they push, they need to run `git fetch`/`git pull` (with the `--rebase` flag) to make sure that their master branch isn't out of date.

> Note: Discuss the pros and cons.

(+) Very simple

(-) Collaboration is kind of clunky.

#### Feature Branch Workflow

**How It Works**: This workflow is very similar to the 'Centralized' workflow. The biggest difference is that there are branches (which helps to keep feature-related commits isolated), and that instead of pushing changes up directly, collaborators (a) push up changes to a new remote branch rather than master, and (b) submit a pull request to ask for them to be added to the remote repo's `master` branch.

> Note: Discuss the pros and cons.

(+) Better isolation than Centralized model, but sharing is still easy. Very flexible.

(-) Sometimes it's too flexible - it doesn't distinguish in any meaningful way between different branches, and that lack of structure can be problematic for larger projects.

#### 'Gitflow' Workflow
**How It Works**: Similar to the Feature Branch workflows, but with more rigidly-defined branches. For example:
- Historical Branches : `master` stores official releases, while `develop` serves as a living 'integration branch' that ties togther all the standalone features.
- Release Branches : 'release' branches might exist for any given release, to keep all of those materials together.
- Feature Branches : pretty much the same as in the prior model.
- Maintenance/'Hotfix' Branches : branches used to quickly patch issues with production code.

> Note: Discuss the pros and cons.

(+) Highly structured - works well for large projects.

(-) Sometimes overkill for something small.

#### Distributed Workflows
These approaches all use multiple remote repos; typically, everyone has their own fork of the 'original' project (the version of the repo that's publicly visible and is managed by the project maintainer), and changes are submitted via pull request.

- **Integration Manager Workflow**

**How It Works**: One collaborator plays the role of 'Integration Manager'. This means that they are responsible for managing the official repository and either accepting or rejecting pull requests as they come in.

> Note: Discuss the pros and cons.

(+) One student integrates all changes, so there's consistency.

(-) Could get overwhelming for large projects.

- **Dictator/Lieutenants Workflow**

**How It Works**: This workflow is very similar to the Integration Manager Workflow. The biggest difference is that rather than submitting all pull requests to a single integration manager, PRs are funneled through 'Lieutentants', who all report to the 'Dictator'. Only the Dictator has write access to the official repo.

(This workflow basically has the opposite tradeoff of the previous one).


## Conclusion (5 mins)
- Explain the difference between `rebase` and `merge`
- Identify how pull requests work in the context of using Git/GitHub to collaborate

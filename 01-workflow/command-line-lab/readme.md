![](https://ga-dash.s3.amazonaws.com/production/assets/logo-9f88ae6c9c3871690e33280fcf557f33.png)
# Command line lab

## Introduction

> ***Note:*** _This can be a pair programming activity or done independently._

Developing web apps requires a degree of comfort navigating and interacting with your operating system through the command line, and similar to how you'll be practicing writing and running Ruby and JavaScript later in the course, we'll be practicing creating, modifying, and moving files and folders in your terminal to get you practicing Unix commands.

For your first lab, you're going to create files and folders to organize your favorite books, movies, and music - then, you're going to reorganize them.

Be sure to use the cheatsheets in the "Additional Resources" section in case you get stuck.

## Exercise

#### Requirements

- From your `~/code` create a folder call `labs`
- Now go to [wdi-hk-9/my-favourite-things](https://github.com/wdi-hk-9/my-favourite-things) and create a create a new `fork`
- After creating a repo, copy the git link into your clipboard
- in iterm under the directory `~/code/labs` enter `git clone the-link-in-clipboard my-favorite-things`
- Then `cd my-favorite-things`

- Organize your favorite books
  - in the "my-favorite-things" folder, create a folder called "books"
  - create a folder in books named after your favorite author (e.g. "mark-twain", or "john-grisham", but avoid spaces!)
  - create files named after some of the author's books in the author's folder
  - open the books folder in atom/sublime
  - edit each file to put a brief description of the book


- Organize your favorite movies

  - in the "my-favorite-things" folder, create a folder called "movies"
  - create a folder in movies named after your favorite actor
  - create a folder in the actor folder named after the actor's breakthrough movie
  - create a text file named after the actor's character in the breakthrough movie in the top level "movies" directory
  - move the text file to the breakthrough movie's folder
  - look back at Sublime/Atom and edit that text file with a description of the character's role in the movie


- Organize your favorite music

  - in the my-favorite-things folder, create a folder called "music"
  - move into the "music folder"
  - create a folder called "disco"
  - create a text file in "disco" called "ymca"
  - delete the "disco" folder
  - create a folder called "creed"
  - delete the "creed" folder
  - create folders called "one-direction", "the-strokes", and "rihanna"
  - create a text file in "one-direction" called "what-makes-you-beautiful.txt"
  - make two copies "what-makes-you-beautiful.txt" - one into "the-strokes" and one into "rihanna" and rename those files with songs by those artists


- Reorganize _everything_

  - in the my-favorite-things folder, create a folder called "media"
  - move "books", "movies", and "music" into the "media" folder


- Organize the top music, movies, and books of 2015

  - move to the my-favorite-things folder and copy the "media" folder, then, rename it "2015-media"
  - in the 2015-media folder, rename each folder to have "2015-" before the title
  - delete the contents of "2015-music", "2015-movies", and "2015-books"
  - create a file called "top-ten-movies.html" in "2015-movies"
  - create a file called "top-ten-songs.html" in "2015-music"
  - create a file called "top-ten-books.html" in "2015-books"
  - create an ordered list - using HTML! - of the top 10 movies, songs, and books in each of the appropriate files

**Bonus**

- Look through the additional resources and do the following

  - look at the top/bottom 10 lines of each file
  - figure out how search through a file from the command line - without opening the file - for a string of text

#### How to Submit
In iTerm under `~/code/labs/my-favorite-things` enter the following commands
```
git add .
git commit -m "done"
git push origin master
```

#### Starter code

No starter code needed for this lab!

#### Deliverable

Be sure you open up your "my-favorite-things" directory in Sublime/Atom, so you can track your progress. Here's a look at what your files/folders should look like after each big step in the exercise:

- After "Organize your favorite books":

![](https://i.imgur.com/ySAjOeO.png)

- After "Organize your favorite movies":

![](https://i.imgur.com/h8WcyVE.png)

- After "Organize your favorite music":

![](https://i.imgur.com/T4E3eAg.png)

- After "Reorganize _everything_"

![](https://i.imgur.com/GEoIps9.png)

- After "Organize the top music, movies, and books of 2015"

![](https://i.imgur.com/EM2m8mL.png)

## Additional Resources

- A list of [CLI Shortcuts](/01-workflow/terminal-navigating-the-file-system-lesson/cli-shortcuts.md)
- An awesome Unix command [cheatsheet](https://github.com/veltman/clmystery/blob/master/cheatsheet.md)

# Deploying a node Application

### Objectives
*After this lesson, students will be able to:*

- Deploy a Node.js app
- Push and pull from MongoDB using a live web interface
- Compare deployment with Rails and a relational database to Node with a noSQL database

### Preparation
*Before this lesson, students should already be able to:*

- Describe How Heroku works
- Explain what a git remote is and how to push

## Heroku and Node - Intro (10 mins)

We've learned how to use Node.js and mongoDB, but again, a web app hosted on your laptop is not really useful. Today, we'll deploy our Animal Shelter app to a server online so that everyone can access it on the web.  Because we deployed our Rails app to Heroku a few weeks ago, this lesson assumes that you have subscribed to Heroku and that your ssh key is uploaded to Heroku.  There are a few other configurations we must make to our application to ensure we can successfully push to production.

First, we'll need a functioning git repository with our application that includes a package.json file - remember, this is used by Node’s dependency manager.  Just like a `Gemfile`, the package.json file determines the of Node.js used to run your application and includes any dependencies your application needs to run. Upon deployment, Heroku reads this file and installs the correct versions and appropriate dependencies using the  `npm install` command.

## Set up your app for deployment - Codealong (25 mins)

To verify that the Heroku CLI toolbelt os properly working , type:

```bash
heroku auth:whoami
```

This should display the email corresponding to the logged in account.

#### Good to go? Let's deploy

Please take the Animal Shelter app - that uses Mongoose and Express - in the [repo](https://github.com/wdi-hk-9/lesson-heroku-node-deployment) . Before deploying, you should be able to run this app locally, so be sure to test it out with `node app.js`

> Note: Make sure students execute this app outside of any git folder.

Once you have the folder with app and verify that it's running, start by initiating git in the app folder:

```bash
git init
```

#### Procfile

A `Procfile` is a text file in the root directory of your application - it's used to declare, to Heroku's computers, what command should be run to start your application; and we've used this before in Rails/Sinatra. Since we are no longer in development, we are not going to be responsible for starting up our server. The `Procfile` will act as a sort of configuration file for Heroku.  To get started we only need one command in there, and the command denoted will declare: a single process type, web, and the command your app needs. `web` is crucial for this file - it's saying that this process type will be attached to the HTTP routing stack of Heroku and take web requests when the application goes live.

As you would imagine, Procfiles can contain more commands and processes. Think about a background job that works through jobs in a queue or a task you would want to run daily.

To set this up, in the main directory of your application create a new file called `Procfile` - you do not need to add a file extension.  Add the following line to the `Procfile`:

```
web: node app.js
```

Install the NPM packages using `npm install`.

now you should be able to launch the server using foreman by running the command below:

```bash
foreman start web
```

Now, you should then see the classic Node log.

#### Change the urls for production

If you take a look in `app.js`, you should see the code that create the connection to mongoDB:

```
moongoose.connect('mongodb://localhost/animalshelter');
```

The URL `'mongodb://localhost/animalshelter'` is obviously only valid when we are running the app locally, but on Heroku, we need to use a url that is stored in the environment variables by Heroku.

To do this we will use a Heroku add-on - think the AppStore but for developers. Heroku add-ons give us the option for extra functionality and services that we can add to our Heroku application. The add-on that we will use to host our mongo Database is called mongolab.  Everytime you add this add-on to an Heroku app, this action will add the environment variable `MONGOLAB_URI` to the Heroku app.

To access environment variables in a node app, we can use `process.env`.

In the code, we will use the `MONGOLAB_URI` value if it exists and use the local one is it doesn't - this will prevent us from having to change the value wether we run the app locally or on Heroku.  Check it out:

```javascript
var mongoUri =  process.env.MONGOLAB_URI || 'mongodb://localhost/animalshelter';
moongoose.connect(mongoUri);
```

#### Change the urls for production

We'll have to apply the same logic we wrote for the db connection to the the port where the app is running.  This port will be automatically assigned by Heroku and be stored under the key `PORT` in the environment variables. Around the line 24, you can see the port where the app is open:

```javascript
app.listen(3000)
```

Replace this code with:

```javascript
app.listen(process.env.PORT || 3000 )
```

#### Commit all changes and deploy!

Now our codebase is ready to be deployed, but first, we need to add mongolab to our Heroku app:

```bash
heroku addons:create mongolab:sandbox
```

`git add` and `git commit` all the changes and then deploy them by typing

```bash
git push heroku master
```

#### You made it!
Once the deployment is done, open Google Chrome and go to `http://YOURHEROKUAPP.herokuapp.com/animals` and you should see the index page online!  Remember, you can always type in `heroku open` to launch the application from the command line.


## Tools for production in Node - Demo (10 mins)

>Note: Demonstrate the following using the app we deployed previously.

There are a couple of tools we can use in production for troubleshooting and error handling:

`heroku restart` will let us restart our server and make sure all of our configuration details are up-to-date.  You'd be surprised how much can be fixed by simply restarting the server; it's a big reason Heroku restarts every one of its applications daily!

Again, for efficiency, `heroku open` will open up your app in the browser.

If there are errors, you can use the command `heroku logs` to get a print out of the production logs for your application. These are just like the logs we had printing to our console in development mode. With this, you'll be able to search for what caused your application to crash and debug. Remember any changes you make to your application locally will require you to add, commit, and push to Heroku again. You **do not** need to repeat the database configuration.

If the app is not working locally using foreman, don't go further.  It will not work on Heroku. You need to have a working app locally first.


## Your turn to deploy - Independent Practice (25 mins)

Choose any other Express code base you've built and push it live.  Use what you just learned from lecture and the code we wrote, too.  Share the url with your instructor via Slack.


## Conclusion (5 mins)

- Identify the configuration changes we need to make to ensure our application will work on Heroku's production servers.
- How does deployment in Rails compare to Heroku?
- Further reading: [Getting Started with Node.js in Heroku](https://devcenter.heroku.com/articles/getting-started-with-nodejs#introduction)

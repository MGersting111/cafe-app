# README
Welcome to the Cafe-App - proudly built with ❤️ and ☕.
At the core a rather Rails 7 & bootstrap.

# Setup
## Prerequisites
You will need postgres. The easiest way is to use the PostgresApp. (https://postgresapp.com/)

Also make sure to have the newest versions of `git` and `brew` installed.
The ones shipping with you OSX are well outdated.
You should also install `rvm` (https://rvm.io/)

After checking out the sourcecode install the bundle:

```
  ./bundle install
```

## Frontend
The frontend assets are built with esbuild.
You need the following packages before everything will run smoothly.

```
brew install yarn
brew install node
brew install libsass
brew install node-sass
```

The run
```
yarn install
```

## Database
Then setup the database. Run:

```
  ./bin/rails db:create
  ./bin/rails db:migrate
  ./bin/rails db:seed
```

## Running the application
Since you need both - the running railsserver as well as the build pipeline watching asset changes,
it is best when you start the application with

```
  bin/dev
```

(which will essentially use foreman with `foreman start -f Procfile.dev`).

# Development

## Code Linter
We use rubocop. It is as simple as calling:
```
  rubocop # runs a linter run and outputs info.
```
You can also add an alias to you console, for example sth. like:

```
  alias lint="rubocop -A"
```
This will then run the rubocop and try to autocorrect whatever it can.

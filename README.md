# README
Welcome to the Cafe-App - proudly built with ❤️ and ☕.
At the core a rather Rails 7 & bootstrap.

## Setup

### Prerequisites
You will need postgres. The easiest way is to use the PostgresApp. [PostgresApp](https://postgresapp.com/)

Also make sure to have the newest versions of `git` and `brew` installed.
The ones shipping with you OSX are well outdated.
You should also install `rvm` [rvm.io](https://rvm.io/)

After checking out the sourcecode install the bundle:

```
  ./bundle install
```

### Frontend
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

### Database
Then setup the database. Run:

```
  ./bin/rails db:create
  ./bin/rails db:migrate
  ./bin/rails db:seed
```

### Running the application
Since you need both - the running railsserver as well as the build pipeline watching asset changes,
it is best when you start the application with

```
  bin/dev
```

(which will essentially use foreman with `foreman start -f Procfile.dev`).

## Development

### Code Linter
We use rubocop. It is as simple as calling:
```
  rubocop # runs a linter run and outputs info.
```
You can also add an alias to you console, for example sth. like:

```
  alias lint="rubocop -A"
```
This will then run the rubocop and try to autocorrect whatever it can.

## Deployment
Currently we use fly.io. You need to install their cli:
```
brew install flyctl
```

Head over to fly.io and create your personal account.
(Proceed on the webpage WITHOUT creating a new app. You will get added to the existin project soon.)

Initially the vafe-app core team has set up a fly organization "cafe-app-dev-team".
You must ask one of the existing members to get added (invite via fly.io).
As soon as you are added you will have access to the cafe-app project on fly.io.
Now click on the links of the confirm mail and the invite mail.

Then run

```
flyctl auth login
```

Now run
```
flyctl apps list
```
if you see the `cafe-app` and `cafe-app-db` you are set up.


## Fly.io cheat sheet
See all commands [here](https://fly.io/docs/flyctl).
The most important ones for us are:

```
   flyctl list apps             # see your current projects
   flyctl deploy                # deploys the current state of the app
   flyctl machine list          # gives overview over the "virtualized machines"
   flyctl console -a cafe-app   # starts an temporary (ephemeral) machine and runs rails c
   flyctl status                # Shows meta info on the app - including the current URL!

   # Arbitrary commands work like this:
   fly ssh console -a your-app-name -C "your command goes here"

   fly ssh console -a cafe-app -C "bin/rails db:seed"              # seeding
   fly ssh console -a cafe-app -C "bin/rails db:migrate"           # migrate
   fly ssh console -a cafe-app -C "bin/rails db:rollback"          # rollback
   fly ssh console -a cafe-app -C "bin/rails db:migrate:status"    # migrate status
```

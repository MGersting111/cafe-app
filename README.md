# README

Welcome to the Cafe-App - proudly built with ❤️ and ☕.
At the core a rather Rails 7 & bootstrap.

After checking out the source install the bundle:

```
  bundle install
```

you need the following packages

```
brew install yarn
brew install node
brew install libsass
brew install node-sass
yarn install
```

Then setup the database

```
  ./bin/rails db:create
  ./bin/rails db:migrate
  ./bin/rails db:seed
```

Start the development server with

```
  foreman start -f Procfile.dev
```

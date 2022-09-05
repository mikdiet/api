# Generating

```bash
rm -rf public rubydoc railsdoc ruby rails
git clone --depth=1 --branch v6.1.6.1 https://github.com/rails/rails.git
git clone --depth=1 --branch v3_1_2 https://github.com/ruby/ruby.git
bundle exec sdoc --template=rails -o rubydoc -g --debug -m 'ruby/README.md' ruby
bundle exec sdoc --template=rails -o railsdoc -g --exclude=test --debug -m "rails/README.md" rails
bundle exec sdoc-merge --title "Rails v6.1.6.1, Ruby v3.1.2" --op public --names "rails, ruby" railsdoc rubydoc
```

# Testing

For manual testing of generated docs:

```bash
ruby -run -ehttpd rubydoc -p8000
ruby -run -ehttpd railsdoc -p8000
ruby -run -ehttpd public -p8000
```

# Deployment

This is a part of [Rusrails][https://github.com/morsbox/rusrails] project. Full server setup is in the main project.
Setup:

```
bundle exec cap production nginx:setup
```

Deployment:

```
bundle exec cap production deploy
```

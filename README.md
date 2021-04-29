# Generating

```bash
rm -rf public rubydoc railsdoc ruby rails
git clone --depth=1 --branch v6.0.3.6 https://github.com/rails/rails.git
git clone --depth=1 --branch v2_6_7 https://github.com/ruby/ruby.git
bundle exec sdoc --template=rails -o rubydoc -g --debug -m 'ruby/README.md' ruby
bundle exec sdoc --template=rails -o railsdoc -g --exclude=test --debug -m "rails/README.md" rails
bundle exec sdoc-merge --title "Rails v6.0.3.6, Ruby v2.6.7" --op public --names "rails, ruby" railsdoc rubydoc
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

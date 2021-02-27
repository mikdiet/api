# Generating

```bash
rm -rf public rubydoc railsdoc ruby rails
git subtree add --prefix=ruby https://github.com/ruby/ruby.git v2_6_6 --squash
git subtree add --prefix=rails https://github.com/rails/rails.git v6.0.3.5 --squash
bundle exec sdoc --template=rails -o rubydoc -g --debug ruby
bundle exec sdoc --template=rails -o railsdoc -g --exclude=test --debug -m "rails/README.md" rails
bundle exec sdoc-merge --title "Rails v5.2.3, Ruby v2.6.3" --op public --names "rails, ruby" railsdoc rubydoc
```

# Deployment

This is a part of [Rusrails][https://github.com/morsbox/rusrails] project. Full server setup is in the main project.
Setup:

```
cap production nginx:setup
```

Deployment:

```
cap production deploy
```

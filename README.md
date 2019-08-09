# Generating

```
git fetch -t
rm -rf public rubydoc railsdoc
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

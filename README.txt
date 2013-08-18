git fetch -t
SDOC_FORCE_MAIN_PAGE='ruby/README' bundle exec sdoc --template=rails -o rubydoc -g --debug ruby
SDOC_FORCE_MAIN_PAGE='rails/README.md' bundle exec sdoc --template=rails -o railsdoc -g --exclude=test --debug rails
bundle exec sdoc-merge --title "Rails v4.0.0, Ruby v2.0.0p247" --op public --names "rails, ruby" railsdoc rubydoc

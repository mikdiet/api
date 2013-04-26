bundle exec sdoc ruby -o rubydoc --debug
bundle exec sdoc rails -o railsdoc --debug
bundle exec sdoc-merge --title "Ruby v2.0.0p0, Rails v4.0.0.beta" --op public --names "Ruby,Rails" rubydoc railsdoc

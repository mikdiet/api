bundle exec sdoc ruby --template=rails -o rubydoc --main=README -G --debug
bundle exec sdoc rails --template=rails -o railsdoc -G --main=README.md --exclude=test --debug
bundle exec sdoc-merge --title "Ruby v2.0.0p195, Rails v4.0.0.rc1" --op public --names "Ruby,Rails" railsdoc rubydoc

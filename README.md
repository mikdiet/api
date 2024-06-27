# Generating

```bash
rm -rf docs rubydoc railsdoc ruby rails
git clone --depth=1 --branch v7.1.3.4 https://github.com/rails/rails.git
git clone --depth=1 --branch v3_3_3 https://github.com/ruby/ruby.git
bundle exec sdoc --template=rails -o rubydoc -g --debug -m 'ruby/README.md' ruby
bundle exec sdoc --template=rails -o railsdoc -g --exclude=test --debug -m "rails/README.md" rails
bundle exec sdoc-merge --title "Rails v7.1.3.4, Ruby v3.3.3" --op docs --names "rails, ruby" railsdoc rubydoc
echo 'api.rusrails.ru' >> docs/CNAME
```

# Testing

For manual testing of generated docs:

```bash
ruby -run -ehttpd rubydoc -p8000
ruby -run -ehttpd railsdoc -p8000
ruby -run -ehttpd docs -p8000
```

# Deployment

`docs` folder is automatically deploying to Github Pages and available at http://api.rusrails.ru

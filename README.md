## RailsWiki
[![Gem Version](https://badge.fury.io/rb/rails_wiki.svg)](http://badge.fury.io/rb/rails_wiki)

### License

This project rocks and uses [MIT-LICENSE](https://github.com/HackerParadise2014/rails_wiki_engine/blob/master/MIT-LICENSE).

### Installation

This currently depends on a working [paper_trail](https://github.com/airblade/paper_trail) and [devise](https://github.com/plataformatec/devise) install.

To install: 

Add this to your Gemfile
```
gem 'rails_wiki'
```
Then run:
```ruby
rake rails_wiki:install:migrations
```

### Examples

Want to get to your articles from the host rails app?

```ruby
@welcome_article = RailsWiki::Article.find_by_title('welcome')
```

Want to link to those articles?

````
<%= link_to article.pretty_title, rails_wiki.article_path(article) %>
````
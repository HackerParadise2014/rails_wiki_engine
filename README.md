= RailsWiki

This project rocks and uses MIT-LICENSE.

To get started, this currently depends on a working paper_trail and devise install.

```ruby
rake rails_wiki:install:migrations
```

Want to get to your articles from the host rails app?

```ruby
@welcome_article = RailsWiki::Article.find_by_title('welcome')
```

Want to link to those articles?

````
<%= link_to article.pretty_title, rails_wiki.article_path(article) %>
````
module RailsWiki
    class Article < ActiveRecord::Base
      validates_uniqueness_of :title

      include FriendlyId
      friendly_id :title
      has_paper_trail

      before_save :slugify_title

      def slugify_title
        self.title = title.downcase.gsub(" ","-")
      end

      def pretty_title
        title.gsub("-",' ').titlecase
      end
  end
end

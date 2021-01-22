module Jekyll
  class CategoryPageGenerator < Generator
    safe true

    def generate(site)
      if site.layouts.key? 'category-page'
        dir = site.config['category_dir'] || 'categories'
        site.categories.each_key do |category|
          site.pages << CategoryPage.new(site, site.source, File.join(dir, category), category, "category-page")
        end
      end
      if site.layouts.key? 'tag-page'
        tagdir = site.config['tag_dir'] || 'tags'
        site.tags.each_key do |tag|
          site.pages << CategoryPage.new(site, site.source, File.join(tagdir, tag), tag, "tag-page")
        end
      end
    end
  end

  # A Page subclass used in the `CategoryPageGenerator`
  class CategoryPage < Page
    def initialize(site, base, dir, category, layout)
      @site = site
      @base = base
      @dir  = dir
      @name = 'index.html'

      self.process(@name)
      self.read_yaml(File.join(base, '_layouts'), "#{layout}.html")
      self.data['category'] = category

      # self.data['title'] = "#{category_title_prefix}#{category}"
      self.data['title'] = category
    end
  end

end

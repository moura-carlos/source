module ItemsHelper
  def format_categories(categories)
    links = categories.map do |category|
      link_to category.title, category_path(category)
    end
    links.to_sentence.html_safe
  end
end

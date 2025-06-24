require "open-uri"

class Metadata
  attr_reader :doc

  def self.retrieve_from(url)
    new(URI.open(url))
  rescue StandardError
    new
  end

  def initialize(html=nil)
    @doc = Nokogiri::HTML(html)
  end

  def attributes
    {
      title: title,
      description: description,
      image: image
    }
  end

  def title
    doc.at_css("title")&.text
  end

  def description
    meta_content "description"
  end

  def image
    meta_content "og:image", attribute: :property
  end

  def meta_content(name, attribute: :name)
    doc.at_css("meta[#{attribute}='#{name}']")&.attributes&.fetch("content", nil)&.text
  end
end

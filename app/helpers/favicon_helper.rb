module FaviconHelper
  def favicon_image_tag(domain, **kwargs)
    image_tag favicon_url(domain), **kwargs
  end

  def favicon_url(domain)
    "https://www.google.com/s2/favicons?domain=#{domain}"
  end
end

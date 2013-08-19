module ApplicationHelper
  def display_video(url)
    parsed_url = URI.parse(url)
    case
    when parsed_url.host.include?('youtube')
      query_params = Rack::Utils.parse_query(parsed_url.query)
      "<iframe width=\"853\" height=\"505\" src=\"//www.youtube.com/embed/#{query_params['v']}\" frameborder=\"0\" allowfullscreen></iframe>".html_safe
    when parsed_url.host.include?('vimeo')
      "<iframe src=\"http://player.vimeo.com/video/#{url.split('/').last}?byline=0&amp;portrait=0&amp;badge=0\" width=\"853\" height=\"479\" frameborder=\"0\" webkitAllowFullScreen mozallowfullscreen allowFullScreen></iframe>".html_safe
    else
      link_to "Click here to watch on #{parsed_url.host} <i class=\"icon-external-link\"></i>".html_safe, url, target: '_blank', class: 'btn btn-primary btn-large'
    end
  end
end

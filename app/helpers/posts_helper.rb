module PostsHelper
  def post_body(post)
    out = body = h(post.body)

    # Extract each hash tag and replace it as a link
    body.scan(/#[\w\-]+/).each do |tag|
      out.gsub! /#{tag}/, link_to(tag, posts_path(:tags => [tag]), :title => tag)
    end

    out
  end
end

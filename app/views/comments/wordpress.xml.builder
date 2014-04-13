xml.instruct!
xml.rss version: '2.0',
  'xmlns:content' => 'http://purl.org/rss/1.0/modules/content/',
  'xmlns:dsq'     => 'http://www.disqus.com/',
  'xmlns:dc'      => 'http://purl.org/dc/elements/1.1/',
  'xmlns:wp'      => 'http://wordpress.org/export/1.0/' do
  xml.channel do
    xml.item do
      xml.title 'Radicaos'
      xml.link 'http://radicaos.com'
      xml.content:encoded, ''
      xml.dsq:thread_identifier, ''
      xml.wp:post_date_gmt, ''
      xml.wp:comment_status, 'open'

      @comments.each_with_index do |comment, i|
        xml.wp:comment do
          xml.wp:comment_id, i+1
          xml.wp:comment_author, comment.name
          xml.wp:comment_author_email, comment.email
          xml.wp:comment_author_url, ''
          xml.wp:comment_author_IP, comment.ip
          xml.wp:comment_date_gmt, comment.created_at.strftime('%F %T')
          xml.wp:comment_content, comment.content
          xml.wp:comment_approved, '1'
          xml.wp:comment_parent, '0'
        end
      end
    end
  end
end

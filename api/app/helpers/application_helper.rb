module ApplicationHelper
  def default_meta_tags
    {
      site: 'Portfolio for ...',
      title: 'Portfolio for ...',
      reverse: true,
      separator: '|',
      description: 'ディスクリプション',
      keywords: '転職者,Web',
      canonical: request.original_url,
      noindex: ! Rails.env.production?,
      icon: [
        { href: image_url('favicon.jpeg') },
        { href: image_url('OGP.png'), rel: 'apple-touch-icon', sizes: '180x180', type: 'image/jpg' },
      ],
      twitter: {
        card: 'summary_large_image',
        site: '@ツイッターのアカウント名',
      }
    }
  end
end

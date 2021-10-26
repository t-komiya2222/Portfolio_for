module ApplicationHelper
  def default_meta_tags
    {
      site: 'WEBエンジニア転職希望者アプリ',
      title: 'Portfolio for ...',
      reverse: true,
      separator: '|',
      description: 'WEB未経験エンジニアのポートフォリオ投稿サイトです。',
      keywords: '転職者,Web',
      canonical: request.original_url,
      noindex: ! Rails.env.production?,
      icon: [
        { href: image_url('favicon.jpeg') },
        { href: image_url('OGP.png'), rel: 'apple-touch-icon', sizes: '180x180', type: 'image/png' },
      ],
      twitter: {
        card: 'summary_large_image',
        site: '@test',
      }
    }
  end
end

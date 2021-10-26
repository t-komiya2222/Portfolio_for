module ApplicationHelper
  def default_meta_tags
    {
      site: 'WEBエンジニア転職希望者アプリ',
      title: 'Portfoliofor',
      reverse: true,
      separator: '|',
      description: 'WEBエンジニアの為のポートフォリオ投稿サイト。共有の場としてして利用してください。',
      keywords: '転職者,Web',
      canonical: request.original_url,
      noindex: ! Rails.env.production?,
      icon: [
        { href: image_url('favicon.jpeg') },
        { href: image_url('OGP.png'), rel: 'apple-touch-icon', sizes: '180x180', type: 'image/png' },
      ],
      og: {
        site_name: 'WEBエンジニア転職希望者アプリ',
        title: 'Portfoliofor',
        description: 'WEBエンジニアの為のポートフォリオ投稿サイト。共有の場としてして利用してください。', 
        type: 'website',
        url: request.original_url,
        image: image_url('OGP.png'),
        locale: 'ja_JP',
      },
      twitter: {
        card: 'summary_large_image',
        site: 'WEBエンジニア転職希望者アプリ',
        title: 'Portfoliofor',
        description: 'WEBエンジニアの為のポートフォリオ投稿サイト。共有の場としてして利用してください。',
        type: 'website',
        url: request.original_url,
        image: image_url('OGP.png'),
        locale: 'ja_JP',
      }
    }
  end
end

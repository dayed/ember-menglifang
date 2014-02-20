Menglifang.Widgets.BsPaginationItem = Ember.ObjectProxy.extend
  text: Ember.computed.alias('content')
  href: (->
    "#{@get('url')}/#{@get('content')}"
  ).property('content', 'url')

  disabled: (->
    @get('content') == @get('current')
  ).property('content', 'current')

Menglifang.Widgets.BsPagination = Ember.Component.extend
  tagName: 'ul'
  layoutName: 'components/mlf-bs-pagination'

  classNames: ['pagination']
  classNameBindings: ['sizingClassName']

  start: 1
  current: 1
  size: 7
  url: ''

  sizingClassName: (->
    return 'pagination-lg' if @get('sizing') == 'large'
    return 'pagination-sm' if @get('sizing') == 'small'

    ''
  ).property('sizing')

  pages: (->
    [@get('start')...(@get('start') + @get('size'))].map (i) =>
      Menglifang.Widgets.BsPaginationItem.create
        url: @get('url')
        content: i
        current: @get('current')
  ).property('start', 'size', 'current', 'url')

  atFirstPage: (->
    @get('current') == 1
  ).property('current')

  atLastPage: (->
    @get('current') == @get('total')
  ).property('current', 'total')

Menglifang.Widgets.BsPaginationNavButton = Ember.Component.extend
  tagName: 'li'
  layoutName: 'components/mlf-bs-pagination-nav-button'

  classNameBindings: ['disabled:disabled']

  href: (->
    if @get('disabled') then 'javascript:void(0);' else "#{@get('url')}/#{@get('page')}"
  ).property('disabled', 'url')

Menglifang.Widgets.BsPaginationStart = Menglifang.Widgets.BsPaginationNavButton.extend
  page: 1
  text: (-> Ember.String.htmlSafe('&laquo;')).property()
  disabled: Ember.computed.equal('current', 1)

Menglifang.Widgets.BsPaginationPrev = Menglifang.Widgets.BsPaginationStart.extend
  page: (-> @get('current') - 1).property('current')
  text: (-> Ember.String.htmlSafe('&lsaquo;')).property()

Menglifang.Widgets.BsPaginationEnd = Menglifang.Widgets.BsPaginationNavButton.extend
  page: Ember.computed.alias('total')
  text: (-> Ember.String.htmlSafe('&raquo;')).property()

  disabled: (->
    @get('current') == @get('total')
  ).property('current', 'total')

Menglifang.Widgets.BsPaginationNext = Menglifang.Widgets.BsPaginationEnd.extend
  page: (-> @get('current') + 1).property('current')
  text: (-> Ember.String.htmlSafe('&rsaquo;')).property()

Ember.Handlebars.helper 'bs-pagination', Menglifang.Widgets.BsPagination
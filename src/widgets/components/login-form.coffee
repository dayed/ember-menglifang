Menglifang.Widgets.LoginForm = Ember.Component.extend
  layoutName: 'components/mlf-login-form'
  classNames: ['mlf-login-form']

  title: '用户登录'
  copyright: '&copy; 2011-2014 北京梦立方网络科技有限公司'

  registerable: false

  # 缺省登录操作处理函数
  action: 'authenticate'

  titleHtmlSafe: (->
    @get('title').htmlSafe()
  ).property('title')

  copyrightHtmlSafe: ( ->
    @get('copyright').htmlSafe()
  ).property('copyright')

  didInsertElement: ->
    Ember.$('input#identification').focus()

  actions:
    login: ->
      @sendAction('action')

Ember.Handlebars.helper 'login-form', Menglifang.Widgets.LoginForm

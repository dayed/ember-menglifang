App.SideBarController = Ember.Controller.extend
  toolbarLinks: [
    { icon: 'fa fa-file-text-o', text: '说明文档', route: 'side_bar.index' }
    { icon: 'fa fa-eye', text: '在线演示', route: 'side_bar.demo' }
  ]

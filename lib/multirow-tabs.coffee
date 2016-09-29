module.exports = MultirowTabs =

  activate: (state) ->
    atom.packages.activatePackage('tabs').then ->
      pane = atom.workspace.getActivePane()
      paneElement = atom.views.getView(pane)
      tabBar = paneElement.getElementsByClassName('tab-bar')
      if tabBar.length > 0
        tabBar[0].classList.add('multirow-tabs')

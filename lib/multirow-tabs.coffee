MultirowTabsView = require './multirow-tabs-view'
{CompositeDisposable} = require 'atom'

module.exports = MultirowTabs =
  multirowTabsView: null
  modalPanel: null
  subscriptions: null

  activate: (state) ->
    @multirowTabsView = new MultirowTabsView(state.multirowTabsViewState)
    @modalPanel = atom.workspace.addModalPanel(item: @multirowTabsView.getElement(), visible: false)

    # Events subscribed to in atom's system can be easily cleaned up with a CompositeDisposable
    @subscriptions = new CompositeDisposable

    # Register command that toggles this view
    @subscriptions.add atom.commands.add 'atom-workspace', 'multirow-tabs:toggle': => @toggle()

  deactivate: ->
    @modalPanel.destroy()
    @subscriptions.dispose()
    @multirowTabsView.destroy()

  serialize: ->
    multirowTabsViewState: @multirowTabsView.serialize()

  toggle: ->
    console.log 'MultirowTabs was toggled!'

    if @modalPanel.isVisible()
      @modalPanel.hide()
    else
      @modalPanel.show()

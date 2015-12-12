{CompositeDisposable} = require 'atom'

module.exports = MultirowTabs =

  activate: (state) ->
    # Events subscribed to in atom's system can be easily cleaned up with a CompositeDisposable
    @subscriptions = new CompositeDisposable

    # Register command that toggles this styling
    @subscriptions.add atom.commands.add 'atom-workspace', 'multirow-tabs:toggle': => @toggle()

  deactivate: ->
    @subscriptions.dispose()

  toggle: ->
    pane = atom.workspace.getActivePane()
    paneElement = atom.views.getView(pane)
    paneElement.getElementsByClassName('tab-bar')[0].classList.toggle('multirow-tabs');

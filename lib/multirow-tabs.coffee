{CompositeDisposable} = require 'atom'

module.exports = MultirowTabs =

  activate: (state) ->
    # Events subscribed to in atom's system can be easily cleaned up with a CompositeDisposable
    @subscriptions = new CompositeDisposable

    # Register command that toggles this view
    @subscriptions.add atom.commands.add 'atom-workspace', 'multirow-tabs:toggle': => @toggle()

  toggle: ->
    console.log 'MultirowTabs was toggled!'
    document.getElementsByClassName('tab-bar')[0].classList.toggle('multirow-tabs');

module.exports =
class MultirowTabsView
  constructor: (serializedState) ->
    # Create root element
    @element = document.body
    @element.classList.add('multirow-tabs')

  # Returns an object that can be retrieved when package is activated
  serialize: ->

  # Tear down any state and detach
  destroy: ->
    @element.classList.remove('multirow-tabs')

  getElement: ->
    @element

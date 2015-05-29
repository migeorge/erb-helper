{CompositeDisposable} = require 'atom'

module.exports =
  subscriptions: null

  activate: ->
    @subscriptions = new CompositeDisposable
    @subscriptions.add atom.commands.add 'atom-workspace', {
      'erb-helper:output'  : => @output()
      'erb-helper:eval'    : => @eval()
      'erb-helper:comment' : => @comment()
    }

  deactivate: ->
    @subscriptions.dispose()

  output: ->
    @insertTag('<%=  %>')

  eval: ->
    @insertTag('<%  %>')

  comment: ->
    @insertTag('<%#  %>')

  insertTag: (tag) ->
    editor = atom.workspace.getActiveTextEditor()
    selection = editor.getSelectedText()
    [openTag, ..., closeTag] = tag.split " "

    if selection
      editor.insertText(openTag + " #{selection} " + closeTag)
    else
      editor.insertText(tag)
      editor.moveLeft(3)

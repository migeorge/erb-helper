{CompositeDisposable} = require 'atom'

module.exports =
  subscriptions: null

  activate: ->
    @subscriptions = new CompositeDisposable
    @subscriptions.add atom.commands.add 'atom-workspace', {
      'erb-helper:output'  : => @output()
      'erb-helper:eval'    : => @eval()
      'erb-helper:comment' : => @comment()
      'erb-helper:end'     : => @end()
    }

  deactivate: ->
    @subscriptions.dispose()

  output: ->
    @insertTag('<%=  %>', false)

  eval: ->
    @insertTag('<%  %>', false)

  comment: ->
    @insertTag('<%#  %>', false)

  end: ->
    @insertTag('<% end %>', true)

  insertTag: (tag, isBlockLevel) ->
    editor = atom.workspace.getActiveTextEditor()
    selection = editor.getSelectedText()
    [openTag, ..., closeTag] = tag.split " "

    if isBlockLevel
        editor.insertText(tag)
    else
      if selection
        editor.insertText(openTag + " #{selection} " + closeTag)
      else
        editor.insertText(tag)
        editor.moveLeft(3)

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
      'erb-helper:if'      : => @if()
      'erb-helper:else'    : => @else()
      'erb-helper:elsif'   : => @elsif()
    }

  deactivate: ->
    @subscriptions.dispose()

  output: ->
    @insertTag('<%=  %>')

  eval: ->
    @insertTag('<%  %>')

  comment: ->
    @insertTag('<%#  %>')

  end: ->
    @insertTag('<% end %>', true)

  if: ->
    @insertTag('<% if %>', true)

  else: ->
    @insertTag('<% else %>', true)

  elsif: ->
    @insertTag('<% elsif %>', true)

  insertTag: (tag, isBlockLevel = false) ->
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

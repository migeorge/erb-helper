module.exports =
  activate: ->
    atom.workspaceView.command "erb-helper:output", => @output()
    atom.workspaceView.command "erb-helper:eval",   => @eval()
    atom.workspaceView.command "erb-helper:comment", => @comment()

  output: ->
    editor = atom.workspace.activePaneItem
    selection = editor.getSelection().getText()

    if selection
      editor.insertText("<%= #{selection} %>")
    else
      editor.insertText('<%=  %>')
      editor.moveCursorLeft()
      editor.moveCursorLeft()
      editor.moveCursorLeft()

  eval: ->
    editor = atom.workspace.activePaneItem
    selection = editor.getSelection().getText()

    if selection
      editor.insertText("<% #{selection} %>")
    else
      editor.insertText('<%  %>')
      editor.moveCursorLeft()
      editor.moveCursorLeft()
      editor.moveCursorLeft()

  comment: ->
    editor = atom.workspace.activePaneItem
    selection = editor.getSelection().getText()

    if selection
      editor.insertText("<%# #{selection} %>")
    else
      editor.insertText('<%#  %>')
      editor.moveCursorLeft()
      editor.moveCursorLeft()
      editor.moveCursorLeft()

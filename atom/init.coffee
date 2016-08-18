
# Your init script
#
# Atom will evaluate this file each time a new window is opened. It is run
# after packages are loaded/activated and after the previous editor state
# has been restored.
#
# An example hack to log to the console when each text editor is saved.
#
# atom.workspace.observeTextEditors (editor) ->
#   editor.onDidSave ->
#     console.log "Saved! #{editor.getPath()}"
################################################################################

# Notify about font size
atom.config.onDidChange 'editor.fontSize', (value) ->
  msg = 'Font size changed from ' + value.oldValue + ' to ' + value.newValue
  atom.notifications.addInfo msg

# Basic reformat
atom.commands.add 'atom-text-editor', 'custom:reformat': (event) ->
  editor = atom.workspace.getActiveTextEditor()
  oldRanges = editor.getSelectedBufferRanges()
  editor.selectAll()
  atom.commands.dispatch(atom.views.getView(editor), 'editor:auto-indent')
  editor.setSelectedBufferRanges(oldRanges)

# Replace surrounding characters (like quotes, brackets, etc) with another
# characters based on event keystroke.
# Bind it like this:
#     # This replaces surrounding characters with "
#     'ctrl-alt-\' "': 'custom:replace-surrounding'
atom.commands.add 'atom-text-editor', 'custom:replace-surrounding': (event) ->
  editor = atom.workspace.getActiveTextEditor()
  keystroke = atom.keymaps.keystrokeForKeyboardEvent(event.originalEvent)
  pre = post = keystroke
  if keystroke in ['{', '}']
    pre = '{'
    post = '}'
  if keystroke in ['[', ']']
    pre = '['
    post = ']'
  if keystroke in ['(', ')']
    pre = '('
    post = ')'

  range = editor.getSelectedBufferRange()
  if range.start.row != range.end.row
    return

  editor.mutateSelectedText (selection, index) ->
    beforeRange = [
        [range.start.row, range.start.column - 1],
        [range.start.row, range.start.column]
    ]
    editor.setTextInBufferRange beforeRange, ''

    # -1 because one is deleted
    afterRange = [
        [range.end.row, range.end.column - 1],
        [range.end.row, range.end.column]
    ]
    editor.setTextInBufferRange afterRange, ''

    selection.insertText(pre + selection.getText() + post)

# Swaps two characters around cursor.
atom.commands.add 'atom-text-editor', 'custom:swap': (event) ->
  {Point, Range} = require 'atom'

  editor = atom.workspace.getActiveTextEditor()
  cursorPoint = editor.getCursorBufferPosition()
  prevCharPoint = new Point(cursorPoint.row, cursorPoint.column - 1)
  nextCharPoint = new Point(cursorPoint.row, cursorPoint.column + 1)
  range = new Range(prevCharPoint, nextCharPoint)
  text = editor.getTextInBufferRange(range)

  # Prevent swap if cursor is at the beginning or at the end of line.
  return if text.length is 1

  text = text[1] + text[0]
  editor.setTextInBufferRange(range, text, {normalizeLineEndings: false})
  editor.setCursorBufferPosition(cursorPoint, {autoscroll: false})

# Generate ctags on opening and closing projects
atom.project.onDidChangePaths (projectPaths) ->
  {Task} = require 'atom'

  # temporary disable
  return

  for projectPath in  projectPaths
    console.log projectPath
    cmd = 'ctags'
    args = [
        '-f', '.tags', '--verbose', '--recurse', projectPath, '>/tmp/ctags.log'
    ]
    task = require('child_process').spawn cmd, args, {cwd: projectPath}
    # task.stdout.on 'data', (msg) ->
    #   atom.notifications.addInfo msg + ''
    # task.stderr.on 'data', (msg) ->
    #   atom.notifications.addWarning msg + ''
    projectName = require('path').basename projectPath
    task.on 'close', (code) ->
      if code != 0
        atom.notifications.addWarning "Ctags problem for #{projectName} (#{code})"
      else
        atom.notifications.addInfo "Ctags generated for #{projectName} (#{code})"

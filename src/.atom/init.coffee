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

{Point, Range} = require 'atom'

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
        beforeRange = [[range.start.row, range.start.column - 1], [range.start.row, range.start.column]]
        editor.setTextInBufferRange beforeRange, ''

        # -1 because one is deleted
        afterRange = [[range.end.row, range.end.column - 1], [range.end.row, range.end.column]]
        editor.setTextInBufferRange afterRange, ''

        selection.insertText(pre + selection.getText() + post)

# Swaps two characters around cursor.
atom.commands.add 'atom-text-editor', 'custom:swap': (event) ->
    editor = atom.workspace.getActiveTextEditor()
    cursorPoint = editor.getCursorBufferPosition()
    prevCharPoint = new Point(cursorPoint.row, cursorPoint.column - 1)
    nextCharPoint = new Point(cursorPoint.row, cursorPoint.column + 1)
    range = new Range(prevCharPoint, nextCharPoint)
    text = editor.getTextInBufferRange(range)
    text = text[1] + text[0]
    editor.setTextInBufferRange(range, text, {normalizeLineEndings: false})
    editor.setCursorBufferPosition(cursorPoint, {autoscroll: false})

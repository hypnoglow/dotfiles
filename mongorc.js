// runcom file for mongo shell

// Set ".pretty()" output by default.
// Allow to disable it by ".ugly()".
DBQuery.prototype._prettyShell = true
DBQuery.prototype.ugly = function() {
  this._prettyShell = false
  return this
}
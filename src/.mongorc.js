/**
 * Runcom file for mongo shell.
 */

// Set ".pretty()" output by default.
// Allow to disable this for specific query using ".ugly()".
DBQuery.prototype._prettyShell = true;
DBQuery.prototype.ugly = function() {
  this._prettyShell = false;
  return this
};
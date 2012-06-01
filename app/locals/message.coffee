
module.exports = ->
  # Session-persisted message middleware
  @locals.use (req, res) ->
    # expose "error" and "message" to all
    # views that are rendered.
    res.locals.error = req.session.error or ""
    res.locals.message = req.session.message or ""
    #remove them so they're not displayed on subsequent renders
    delete req.session.error
    delete req.session.message
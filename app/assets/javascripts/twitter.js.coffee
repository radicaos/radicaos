((d, s, id)->
  fjs = d.getElementsByTagName(s)[0]
  unless d.getElementById(id)
    js = d.createElement s
    js.id = id
    js.src = "//platform.twitter.com/widgets.js"
    fjs.parentNode.insertBefore js, fjs
)(document, "script", "twitter-wjs")
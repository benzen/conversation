configService = ->
  messages: ->
    [
      {
        author: 'Ben'
        date: new Date()
        text: "Hey _DuDe_, what's up *boldy*"
      }
      {
        author: 'Simon'
        date: new Date()
        text: "Hey _DuDe_, what's up *boldy*"
      }
      {
        author: 'Carl'
        date: new Date()
        text: "Hey _DuDe_, what's up *boldy*"
      }
   ] 
  repository: ->
    url: "github.com:benzen/conversation.git"
    branch: "gh-conversation"
    workingDirectory: "/Users/benjaminDreux/depot/code3/conversation"

    

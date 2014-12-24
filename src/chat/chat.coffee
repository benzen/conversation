git = require 'simple-git'
fs = require 'fs'

chatController = ($scope, $timeout, configService, momentFilter)->
  repository = git( configService.repository().workingDirectory )

  $scope.messages = configService.messages()

  #TODO scroll when new message
  $timeout(->
    $scope.messages.push 
      author: 'Alf'
      date: new Date()
      text: 'Si on mangeais le chat ?'
  , 1000
  )
  $scope.repository = configService.repository()


  $scope.ifEnterSend = (key)->
    if key.keyCode is 13 then $scope.send()

  $scope.send = ->
    wd = configService.repository().workingDirectory
    date = global.moment().format('YYYY-MM-DD') 
    file = "#{wd}/#{date}.md"
    msg = """
-----------------

#{'user'}
#{global.moment().format()}
#{$scope.message}

-----------------
"""

    fs.appendFile file, msg, ->
      repository.add file, ->
        repository.commit "message", ->
          console.log "we've done it YEAHHH"
       


    $scope.message = ""
    

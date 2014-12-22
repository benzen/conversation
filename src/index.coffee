
createApp = ->
  deps = ["ngRoute", "ngSanitize"]
  angular.module("conversation", deps)

configRoutes = (app) ->
 app.config ($routeProvider)->
   $routeProvider
   .when('/chat', templateUrl: 'chat/chat.html', controller: 'ChatController')
   .when('/config', templateUrl: 'config/config.html', controller: 'ConfigController')
   .otherwise '/chat'

configControllers = (app) ->
  app.controller('ChatController', chatController)

configFilters = (app) ->
  app.filter 'markdown', -> markdownFilter
  app.filter 'moment', -> momentFilter

app = createApp()
configRoutes app
configControllers app
configFilters app

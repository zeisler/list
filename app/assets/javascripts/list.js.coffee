@ListCtrl = ($scope)->
  _is_null = (obj) ->
    if obj == null || obj == "null"
      return true
    else
      return false

  user_name = localStorage.getItem('user_name')
  unless _is_null(user_name)
    $scope.user_name = user_name
  list = localStorage.getItem('list')
  unless _is_null list
    $scope.list = JSON.parse(list)
  else
    localStorage['list'] = ""
  $scope.add_item = ->
    if $scope.list == undefined
      $scope.list = []
    if localStorage['list']
      localStorage['list'] = []
    $scope.list.push($scope.new_item)
    localStorage['list'] = JSON.stringify($scope.list)
    $scope.new_item = ""

  $scope.deleteItem = ->
    $scope.list = _.without($scope.list, @item)
    localStorage['list'] = JSON.stringify($scope.list)

  $scope.set_user_name = ->
    localStorage.setItem('user_name', $scope.user_name)
  $scope.delete_user = ->
    localStorage.setItem('user_name', null)
  $scope.has_user_name = ->
    obj = localStorage.getItem('user_name')
    if obj == null || obj == "null"
      return false
    else
      return true



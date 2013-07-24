@ListCtrl = ($scope)->

  #check localStorage and and if exists load it
  unless _.isUndefined(localStorage.getItem('user_name'))
    $scope.user_name = localStorage.getItem('user_name')
  if _.isNull(localStorage.getItem('list'))
    localStorage['list'] = ""
    $scope.list = []
  else
    $scope.list = JSON.parse(localStorage.getItem('list'))

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
    _.has localStorage, 'user_name'




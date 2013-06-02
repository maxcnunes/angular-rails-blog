App.controller 'PostsCtrl', ['$scope', 'Post', ($scope, Post) ->
	# # Attributes accessible on the view
	# $scope.posts = Post.query()
	# $scope.selectedScreencast = null

	# # Set the selected post to the one which was clicked
	# $scope.showPost = (post) ->
	# 	$scope.selectedPost = post

	# Attributes accessible on the view
	$scope.selectedPost = null
	$scope.selectedRow	= null

	# Gather the posts and set the selected one to the first on success
	$scope.posts = Post.query ->
		$scope.selectedPost = $scope.posts[0]
		$scope.selectedRow = 0

	# Set the selected post to the one which was clicked
	$scope.showPost = (post, row) ->
		$scope.selectedPost = post
		$scope.selectedRow = row
]



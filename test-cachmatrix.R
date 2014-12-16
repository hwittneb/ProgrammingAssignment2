source("cachematrix.R")
#
# Sample run:
# -----------
#
mat <- makeCacheMatrix(matrix(1:4,2))
mat$get()
#      [,1] [,2]
# [1,]    1    3
# [2,]    2    4
mat$getInverse()
# NULL
#
# No cache in the first run
# -------------------------
cacheSolve(mat)
#      [,1] [,2]
# [1,]   -2  1.5
# [2,]    1 -0.5
#
# Retrieving from the cache in the second run
# -------------------------------------------
cacheSolve(mat)
# getting cached data.
# 
#      [,1] [,2]
# [1,]   -2  1.5
# [2,]    1 -0.5
#
mat$getInverse()
#      [,1] [,2]
# [1,]   -2  1.5
# [2,]    1 -0.5
#
imat = mat$getInverse()
mat$get() %*% imat
#      [,1] [,2]
# [1,]    1    0
# [2,]    0    1
#

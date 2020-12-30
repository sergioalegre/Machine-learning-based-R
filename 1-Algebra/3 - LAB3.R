# 1. Define two matrices. Let A be 3 x 4, filled row-wise with the numbers 1-12. 
#    Let B be 4 x 2, filled column-wise with the numbers 1-8.
A <- matrix(1:12, nrow = 3, ncol = 4, byrow = TRUE)
B <- matrix(1:8, nrow = 4, ncol = 2, byrow = FALSE)
A
B


# 2. Explain why A and B cannot be added or subtracted.
A + B
A - B
##### Answer: The dimensions of the matrices are not the same.


# 3. Create a matrix C that can be added to A. Perform the addition.
##### Requirement is that it must have 3 rows and 4 columns
C <- matrix(seq(2,24,by = 2), nrow = 3, ncol = 4, byrow = TRUE)
C

A + C

# 4. Find AB. Before multiplying in R, anticipate the dimensions of the product, 
#    and multiply by hand.
##### 3x4 times 4x2, so product will be 3x2
A %*% B

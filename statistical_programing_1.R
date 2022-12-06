# Exercise Sheet 1: Vectors, matrices, 
#                   arrays, packages

############
# Exercise 2.1
# a)
a <- 2.3
ratio = (6 * a + 42) / 3^(4.2-3.62)
ratio
# b)
b <- -4
value <- b^2 +2
vec <- c((-4)^2+2, -4^2+2, (-4)^(2+2), -4^(2+2))
value == vec
# c)
numbers <- c(25.2, 15, 16.44, 15.3, 18.6)
average <- mean(numbers)
val <- sqrt(average/2)
# d)
?log
val_0 <- 0.3
val_1 <- log(0.3, base = exp(1))
val_1 == log(0.3)
# e) exponential transformation 
fctn <- function(x) {
  exp(x)
}
y <- val_1
fctn(y)
############

############
# Exercise 2.2
# a)
var_01 <- 3^2  * 4^(1/8)
var_01
# b)
var_01 <- 2.33
var_01
# c)
var_02 <- -8.2  * 10^(-13)
print(2.33 * var_02)

############
# Exercise Sheet 2.3
# a)
seq_store <- seq(from = 5, to = -11, by = -0.3)
seq_store
# b) with the ordered reversed
seq_store <- sort(seq_store)
seq_store
# c)
vec_3 <- rep(c(-1, 3, -5, 7, -9), times =2)
vec_3
vec_4 <- rep(c(-1, 3, -5, 7, -9), times =2, each = 10)
vec_4
# d) A sequence of nine values starting at
# 102 and ending at the number that is the
# total length of the vector created in (c)
vec_03 <- c(5:12, rep(c(5.3), times =3),
            -3, seq(from=102, to =length(vec_4), length.out = 9))
length(vec_03) == 21
vec_03

############
# Exercise Sheet 2.4
# a)
vec_store <- c(seq(from =3, to =6, length.out=5), 
                    rep(c(2, -5.1, -33), times =2), 
                    (7/42)+2)
vec_store
# b)
first_element <- vec_store[1]
last_element <- vec_store[length(vec_store)]
# c) 2:length(vec_store)-1  Pay attention, this is not what you wantd to get
var_3 <- vec_store[2:(length(vec_store)-1)] 
var_3
# d)
vec_store <- c(first_element, var_3, last_element)
vec_store
# e)
sorted_vec <- sort(vec_store)
order(vec_store) == sorted_vec
order(vec_store)
# f)
?rev
#f1:f2 # a factor, the "cross"  f1 x f2
1:4
x <- c(sorted_vec[length(sorted_vec):5], rev(sorted_vec[1:4]))
x == rev(sort(x))
sort(x, decreasing = TRUE) == x
# g)
vec_04 <- c(rep(var_3[3], times =3),  
            rep(var_3[6], times =4),
            rep(var_3[length(var_3)]))
vec_04
# h)
new_vec <- sorted_vec
new_vec[1] <- 99
new_vec[5:7] <- 
  seq(from=98, to=96, length.out=length(sorted_vec[5:7]) )
new_vec[length(sorted_vec)] <- 95
new_vec
new_vec[5:7]

############
# Exercise Sheet 2.5
# a)
vec_5 <- c(2, 0.5, 1, 2, 0.5, 1)
inv <- 1/vec_5
vec_5_converted <- vec_5 * inv 
vec_5_converted
# b)
temp <- c(42,77,20,19,101,120,212)
temp_s <- temp -32
temps_s_converted <- (5/9) * temp_s
temps_s_converted
# c)
vec_tobe_produced <- c(2, 4, 6, 4, 8, 12)
vec_01.5 <- rep(c(1,2), each =3)
vec_02.5 <- rep(c(2, 4, 6)[1:3], times =2)
new_vec.5 <- vec_01.5 * vec_02.5
new_vec.5 == vec_tobe_produced
# d)
length(new_vec.5)
new_vec.5[2:5] <- rep(c(-0.1,-100), times =2)  
new_vec.5

############
# Exercise Sheet 3.1
# a)
vlues <- c(4.3,3.1,8.2,8.2,3.2,0.9,1.6,6.5)
mat <- matrix(vlues, 
              nrow =4, ncol =2)
mat
# b)
# removing the second row
mat_1 <- mat[c(1,3,4),]
dim <- dim(mat_1)
c(3,2) == dim
# c)
mat[,2] <- sort(mat[,2])
mat
dim(mat)
# d) 
# first, this is the copy of the second
# colomn two times colomnwise
mat[,c(2,2),drop =TRUE]
mat[c(1,2,3),]
# same as
mat[c(1,2,3),,drop =TRUE]
# droping the second column with it
mat[c(1,2,3), c(1)]
# up< is a row vector
#"drop =FALSE" to transpose the resulted vec(!not mat)
mat[c(1,2,3), c(1), drop =FALSE]
# e)
mat_2.2[,2] <- sort(mat[,2])
mat_2.2 <- matrix(mat_2.2[,2], nrow=2, ncol=2)
mat_2.2
# f)
rplc_vec <- -0.5*diag(mat_2.2)
#Positions for replacement
#(4, 2),
#(1, 2),
#(4, 1),
#(1, 1)
#vlues <- c(4.3,3.1,8.2,8.2,3.2,0.9,1.6,6.5)
#vlues[c(8,5,4,1)] = rplcated_vec
#vlues
#rplcated_mat <- matrix(vlues, nrow =4, ncol = 2)
#rplcated_mat
rplcated_vec
mat[c(4,1), 2] <- rplc_vec
mat[c(4,1), 1] <- rplc_vec
mat

############
# Exercise Sheet 3.2
# a)
a <- 2/7
b <- matrix(c(1,2,7,2,4,6), nrow = 3, ncol=2)
c <- matrix(c(10,30,50,20,40,60), nrow = 3, ncol=2)
result <- a * ( b - c)
result
# b)
A <- matrix(c(1,2,7))
A
B <- matrix(c(3,4,8)) 
B
A*B
A**B
t(B)
t(A) %*% B
t(B)%*%(A%*%t(A))
#not possible
(A%*%t(A))%*%t(B)
#possible
solve((B%*%t(B)+(A%*%t(A))-100*diag(3)), 
      c(1,1,1))
solve(B%*%t(B)+(A%*%t(A))-100*diag(3))
# c)
A <- diag(c(2,3,5,-1))
dim <- c(4,4)
dim(solve(A)%*%A - diag(4)) == dim

############
# Exercise Sheet 3.3
# a)
dat <- seq(from=4.8,to=0.1, length.out=(4*2)*3 ) 
three_dim_array <- array(rep(dat, times=6),
                         dim = c(4,2,3)) 
three_dim_array
# b) fourth- and first-row elements, 
#     in that order,of the second column 
#     only
extracted <- c(three_dim_array[,,1][c(4,1),],
               three_dim_array[,,2][c(4,1),],
               three_dim_array[,,3][c(4,1),])
extracted
# c)
dim(matrix(extracted))
dim(array(extracted))
mat_3 <- array(extracted, dim = c(2,2,2,3))
mat_3    
# d) deleting the sixth layer
three_dim_array
dim(three_dim_Array)
new_array <- array(c(three_dim_array[,,1:2],
                     three_dim_array[,,3][,c(1)]),
                     dim =c(4,1,5) )
# e) Overwrite the second and fourth row elements 
#    of the second column of layers 1, 3, and 5 of (d)
#    with −99
new_array[,,c(1,3,5)][c(2,4),] <- c(-99L,-99L) 
new_array

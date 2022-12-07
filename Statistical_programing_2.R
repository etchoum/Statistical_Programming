# Exercise Sheet 2: Logical values, strings, 
#                     factors (non-numeric values), 
#                     special values



####################################################
# Exercise 4.1
# a)
vec_a <- c(6, 9, 7, 3, 6, 7, 9, 6, 3, 6, 6, 7, 1, 9, 1)
# (i) Those equal to 6
which(vec_a ==6)
# (ii) Those greater or equal to 6
which(vec_a >=6)
# (iii) Those less then 6 + 2
which(vec_a <6+2)
# (iv) Those not equal to 6
which(vec_a !=6)
# b)
new_vec <- vec_a[4:length(vec_a)]
new_vec
arr_1 <- array(new_vec, dim =c(2,2,3))
#(i) Those less then or equal to 6
#    divided by 2, plus 4.
which(arr_1 <= (6/2 +4))
#(ii) Those less then or equal to 6 divided by 2, plus 4, 
#     after increasing every element in the array by 2
which(arr_1 +2 <= (6/2 +4))
# c)
not_1 <- which(matrix(diag(5), ncol=5, nrow=5) ==0)
not_1
# d)
vec_0d <- arr_1[which(arr_1 <= (6/2 +4))]
vec_1d <- arr_1[which(arr_1 +2 <= (6/2 +4))]
any(vec_0d == TRUE)
all(vec_0d == TRUE)
any(vec_1d == TRUE)
all(vec_1d == TRUE)
# e)
any(not_1 == TRUE)
  
  

####################################################
# Exercise 4.2
# a)
foo <- c(7, 1, 7, 10, 5, 9, 10, 3, 10, 2)
which((foo >5) | (foo==2))
foo[which((foo >5) | (foo==2))]
# b)
bar <- c(8, 8, 4, 4, 5, 1, 5, 6, 6, 8)
which((bar <6) & (bar!=4))
bar[which((bar <6) & (bar!=4))]
# c)(i)
foo
bar
baz <- foo +bar
baz[which(baz >=14 & baz !=15)]
# c)(ii)
baz
foo
length(baz) == length(foo) 
length(baz) == length(baz[which(baz >4 | baz <=2)])
baz[which(baz >4 | baz <=2)] / foo



####################################################
# Exercise 4.3
# 1.
foo <- c(7, 5, 6, 1, 2, 10, 8, 3, 8, 2)
# a) 
bar <- foo[which(foo >= 5)]
# b)
foo[which(foo < 5)]
# 2.
baz_resp <- matrix(bar, ncol =2, nrow =3)
baz <- t(baz_resp)
dim(baz)
baz
# a)
baz[which(baz ==8)] <- baz[1,2]^2
baz
# b)
baz[which(baz>4 & baz <=25)]
which(baz>4 & baz <=25) == 1:length(baz)
# 3.
qux <- array(c(10, 5, 1, 4, 7,
               4, 3, 3, 1, 3, 4, 
               3, 1, 7, 8, 3, 7, 3), 
             dim =c(3,2,3))  
# a)
which(qux ==3 | qux ==4)
qux[which(qux ==3 | qux ==4)]
# b)
qux[which(qux <3 | qux>7)] <- 100
qux
# 4. #xtract every second value 
a <- foo[c(seq(from=2, to=length(foo), by= 2))]
# using only logical values
b <- foo[which(foo <=5 | foo ==10)][-c(3)]
a == b



####################################################
# Exercise 4.4
# 1.
s <- "The quick brown fox\n    jumped over\n\tthe lazy dogs"
cat(s)
s
# 2.
(num1 <- 4) & (num2 <- 0.75)
paste( c("The result of multiplying ", num1,
               " by ", num2, " is ", num1-1, "."), collapse = ''
         )
# 3.
string <- "JoeThePlumber@uni-goettingen.de"
  ?substr
# does nt work
#substr(string, 1,13) <- "Emmanuel "

paste(c("Emmanuel", substr(string, 14,31)), collapse="")
# 4. a)
bar <- "How much wood could a woodchuck chuck"
# 4. b)
paste(c(substr(bar, 1,9), "metal ",
        substr(bar, 15,22), "metal",
        substr(bar, 27,37)), collapse = '')
# 5)
str_stored <- "Two 6-packs for $12.99"
# a) # confirm that the substring beginning with character 5 
#      and ending with character 10 is "6-pack"
substr(str_stored, 5,10 )
# b)
substr(str_stored, 18,22)
price_changed <- paste(c(substr(str_stored, 1,17),
                         "10.99"), collapse='')



####################################################
# Exercise 4.5
# 1.
sex <- c("F", "M", "M", "M", "F", "F",
         "F", "M", "M", "M", "M", "F",
         "M", "F", "F", "F")
party <- 1:20
party[c(1, 4, 12, 15, 16, 19)] <- "Labour"
# Maori <- 0
party[c(6, 9, 11)] <- "Greens"
party[c(10,20)] <- "Other"
party
party[which(party != "Labour" &
              party != "Greens" &
              party != "Other")] <- "National"
# 2.
sex_y <- factor(sex)
part_y <- factor(party)
part_y
# it does nt make sense to use ordered = TRUE,
# because the order would then be losed
factor(sex_y, ordered = TRUE)
factor(part_y, ordered = TRUE)
# R shines to arange by alphabetical order of
# the beginning letters
#
# Q: How can you tell R that "Maori" is a factor level 
# even if it doesn’t occur in the vector?
part_y <- factor(part_y, 
                levels = c("Labour", "Greens", "Other", "National", "Maori"))
# 3. a) male participants
part_y[which(sex_y == "M")]
# 3. b)
sex_y[which(part_y == "National")]
# 4.
joined_partici <- c("National", "Maori", "Maori",
                    "Labour", "Greens", "Labour")
partici_gend <- c("M", "M", "F", "F", "F",
                  "M")
combined <- 1:26
combined[1:20] <- party
combined[21:26] <- joined_partici
sex <-factor(c(sex, partici_gend))
sex
combined <- factor(combined)
combined
# 5)
confidence_level <- c(93, 55, 29, 100, 52, 84, 56, 0, 33, 52, 35, 53, 55,
  46, 40, 40, 56, 45, 64, 31, 10, 29, 40, 95, 18,61)
breaks <- c(0,30,70, 100)
Low_for_perc <- cut(confidence_level, 
                    breaks = breaks,
                    labels = c("Low", "Moderate", "High"))
Mod_for_perc <- confidence_level[which(confidence_level <=70 & confidence_level > 30)]
# 6)
labour_levels <- which(combined == "Labour")
labour_percentages <- confidence_level[labour_levels]
National_percentages<- confidence_level[which(combined == "National")]
# Reamarks:
# in 5)
#  "0" was not included in  LOW and MOD_for percentages.
# in 6)
# the max "100" is in labour_percentages,
mean(labour_percentages)
# and the min "0" in National_percentages.
mean(National_percentages)


####################################################
# Exercise 6.1
# 1.
foo <- c(13563, -13156, -14319, 16981, 12921, 11979, 9568, 8833, -12968,
         8133)
# 1. a) Output all elements of the vector that 
#       are finite, when raised to a power of 75.
finites <- foo[which(foo^75 < Inf)]
length(foo) == length(finites)
finites
# 2. b) Elements of foo, excluding those that result 
#       in negative infinity when raised to a power
#       of 75
neg_finites <- foo[which(foo^75 == -Inf)]
neg_finites
finites
??float
# 2.
vec <- c(77875.4, 27551.45, 23764.3, -36478.88,
         -35466.25, -73333.85, 36599.69, -70585.69,
         -39803.81, 55976.34, 76694.82, 47032)
bar <- matrix(vec, nrow = 3, ncol =4)
# 2. a) are NaN when bar raised to a power of 65 and 
#       divided by infinity
na <- which((bar^65/Inf) == "NaN")
na
# 2. b) values in bar that are not NaN when bar is 
#       raised to a power of 67 and 
#       infinity is added to the result
not_na <- which((bar^67 +Inf) != "NaN")
bar[not_na]
#       Confirm this identical to identifying those 
#       values in bar that, 
#       when raised to a power of 67, are 
#       not equal to negative infinity
bar[which((bar^67 != -Inf))] == bar[not_na]


####################################################
# Exercise 6.2
# 1.
foo <- c(4.3, 2.2, NULL, 2.4, NaN, 3.3, 3.1, NULL, 3.4, NA)
# a) True ########################
length(foo)
foo
#consistent behavior?
#  result of out of bounds access to a vector is NA
#  result of out of bounds access to a list is an error
#  result of accessing a not existing list’s member by its name is NULL:

# So the non-existing list member is NULL,
# Therefore not included in foo
fool <- c(4.3, 2.2, "NULL", 2.4, NaN, 3.3, 3.1, "NULL", 3.4, NA)
length(fool)
# b) FALSE ######################
foo
is.na(foo)
which(is.na(foo))
# c) FALSE ######################
is.null(foo)
is.na(foo)
is.null(c(NULL, NULL, NULL))
is.null(c(NULL, NULL, NULL, "NULL"))
is.null(NULL)
# d) TRUE #######################
foo[8] + 4 / NULL
foo[8] + 4 / Inf
foo[8] + 4 / -Inf


#  ENDD ############################################
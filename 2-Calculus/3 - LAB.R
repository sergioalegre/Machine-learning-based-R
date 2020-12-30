#https://www.eduonix.com/dashboard/mathematics-for-data-science-and-ai-using-r/lecture/16108249

# 1. Define the function f(x) = x^4 - 2x^2 + 3 for x between -1.5 and 1.5. Plot
f <- function(x) x^4 - 2*x^2 + 3

plot(f, xlim = c(-1.5,1.5), col = 'blue')



# 2. From the graph, estimate all extreme values and critical points of f.
### ANSWER: -1, 0, 1



# 3. Find f' and plot it. Does f' = 0 at the critical points of f?
library(Deriv)
f.prime <- Deriv(f)

plot(f.prime, xlim = c(-1.5,1.5), col = 'red')
abline(h = 0, lty = 3) ## lty = 3 gives a dashed line

### f' = 0 at -1, 0, and 1


# plot f and f' together, with y = 0
plot(f, xlim = c(-1.5,1.5), ylim = c(-10,10), col = 'blue')
curve(f.prime, xlim = c(-1.5,1.5), ylim = c(-10,10), col = 'red', add = TRUE)
abline(h = 0, lty = 3)



# 4. Verify whether each extreme value is a max or a min by using the Second Der. Test.
### We already know f' = 0 for all three points
f.doubleprime <- Deriv(f.prime)

### If f'' < 0, max; If f'' > 0, min
f.doubleprime(-1) # min
f.doubleprime(0)  # max
f.doubleprime(1)  # min

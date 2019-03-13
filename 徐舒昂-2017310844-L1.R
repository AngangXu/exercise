# build matrixes
x = matrix(1:9, 3, 3)
a = matrix(2:10, 3, 3)
b = matrix(rnorm(9), 3, 3)
d = matrix(rnorm(9), 3, 3)

# 1. With transposition, determinant's value is unchanged. 
y = t(x)
all.equal(det(x), det(y))

# 2. If a row in determinant is 0, then the determinant's value is 0.
x[1, 1:3] = 0
det(x)

# 3. If two rows are the same, then determinant's value is 0.
y[1, 1:3] = y[2, 1:3]
det(y)

# 4. If two rows are proportional, then determinant's value is 0.
a[1, 1:3] = 2*a[2, 1:3]
det(a)

# 5. Add a multiple of a row to another, determinant's value is unchanged.
r1 = b[1, 1:3] + 2*b[2, 1:3]
c = b
c[1, ] = r1
all.equal(det(b), det(c))

# 6. change the position of two rows, determinant's value becomes the opposite.
r2 = d[1, ]
r3 = d[2, ]
e = d
e[1, ] = r3
e[2, ] = r2
all.equal(det(d), -det(e))

# 7. If a row is the sum of two sets, then the determinant's value is equal to the sum of the two determinants.
x[1, ] = x[1, ] - 1
g = x
h = x
x[2, ] = seq(9, 17, 4)
h[2, ] = x[2, ] + g[2, ]
all.equal(det(h), det(x)+det(g))

# 8. Exchange law of matrix addition
y = t(x)
y[1, 1:3] = y[2, 1:3]
x + y == y + x

# 9. Matrix multiplication does not satisfy the commutative law
x %*% y == y %*% x

# 10. Addition and multiplication of matrices satisfy the distribution law.
f = matrix(2:10, 3, 3)
f %*% (x + y) == f %*% x + f %*% y

# 11. The transpose of the sum of the matrices is equal to the sum of the transposes of matrices.
t(x + y) == t(x) + t(y)

# 12. (AB)'=B'A'
t(x %*% y) == t(y) %*% t(x)
t(x %*% y) == t(x) %*% t(y)

# 13. kA+lA=(k+l)A
3*x + 5*x == (3 + 5)*x

# 14. k(AB)=(kA)B=A(kB)
3*(x %*% y) == (3*x) %*% y
3*(x %*% y) == x %*% (3*y)

# 15. The determinant of matrix product is equal to the product of its factor.
r5 = c(2, -1, 0)
r6 = c(1, 1, 3)
r7 = c(4, 2, 1)
r8 = c(2, 1, -1)
m = rbind(r5, r6, r7)
n = rbind(r5, r6, r8)
all.equal(det(m %*% n), det(m)*det(n))

# 16. The inverse of the matrix transpose is equal to the inverse transpose.
all.equal(solve(t(m)), t(solve(m)))

# 17. The inverse of the product of the matrix is equal to the product of the inverse of the swapping order.
all.equal(solve(m %*% n), solve(n) %*% solve(m))

# 18. The determinant of the lower triangular matrix is equal to the product of the diagonal elements.
r9 = c(2, 0, 0)
r10 = c(1, 4, 0)
r11 = c(-1, 3, 5)
p = rbind(r9, r10, r11)
prod(diag(p))

# 19. Laplace expansion
q = p[2:3, 2:3]
j = p[1:2, 1:2]
o = p[-1, ]
o = o[, -2]
p[1, 1]*det(q) - p[1, 2]*det(j) + p[1, 3]*det(o)

# 20. Cramer's law
X = solve(a=m, b=r6)
u = m[, -1]
u = cbind(r6, u)
v = m[, -3]
v = cbind(v, r6)
w = cbind(m[, 1], r6, m[, 3])
x1 = det(u)/det(m)
x2 = det(w)/det(m)
x3 = det(v)/det(m)

# an example of "apply"
mark = array(runif(100, min = 60, max = 100), c(5, 5, 4))
mark = round(mark)
apply(mark, 3, mean)
apply(mark, 3, max)

# an example of "tapply"
report = data.frame(name = c("A", "B", "C", "D"), area = c("beijing", "xian", "beijing", "xian"), score = c(89, 76, 92, 95))
tapply(report[, "name"], report[, "area"], mean)








using LinearAlgebra

#=
Solve the system of diff equations using the eigenvalues and eigenvectors method
dx/dt = 2y
dy/dt = -6x + 7y
=#

A_matrix = [0 2; -6 7]

eigenvals = LinearAlgebra.eigvals(A_matrix)
println("Eigenvalues: $eigenvals")

# Find eigenvector for eigenvalue1 = 3
# (A - lambda+I)x = 0
eq1 = (A_matrix - eigenvals[1]*Matrix(I, 2, 2))
println("System for eigenvalue1: $eq1") # Implies 2k2 = 3k1 => k1 = 2, k2 = 3
eigvec_eigval1 = [getindex(eq1, 1, 2), -getindex(eq1, 1,1)]

# Find eigenvector for eigenvalue2 = 4
eq2 = (A_matrix - eigenvals[2]*Matrix(I, 2, 2))
print("System for eigenvalue2: $eq2") # Implies 2k2 = 4k1 => k1 = 2, k2 = 4
eigvec_eigval2 = [getindex(eq2, 1, 2), -getindex(eq2, 1,1)]

# Solution: X = c1 * (2, 3) e^3t + c2 * (2, 4) e^ 4t
X = Meta.parse("c1 * (2, 3)* exp(3*t) + c2 * (2, 4) * exp(2*t)")
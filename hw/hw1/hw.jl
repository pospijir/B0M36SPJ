function circlemat(n)
    mat = zeros(Int, n, n)
    
    mat[n, 1] = 1
    mat[1, n] = 1

    for x in 2:1:n-1
        mat[x - 1, x] = 1
        mat[x + 1, x] = 1
    end

    mat[2, 1] = 1
    mat[n - 1, n] = 1

    return mat
end


polynomial(a, x) = sum(ia -> x^(ia[1]-1) * ia[2], enumerate(a))

function polynomial(a, x::AbstractMatrix)
    res = zeros(eltype(x), size(x))
    for i in 1:1:length(a)
        res += a[i] * x ^ (i - 1)
    end
    return res
end

println(methods(polynomial))

a10 = circlemat(10)
test1 = [0 1 0 0 0 0 0 0 0 1; 1 0 1 0 0 0 0 0 0 0; 0 1 0 1 0 0 0 0 0 0; 0 0 1 0 1 0 0 0 0 0; 0 0 0 1 0 1 0 0 0 0; 0 0 0 0 1 0 1 0 0 0; 0 0 0 0 0 1 0 1 0 0; 0 0 0 0 0 0 1 0 1 0; 0 0 0 0 0 0 0 1 0 1; 1 0 0 0 0 0 0 0 1 0]

# println(a10, typeof(a10), eltype(a10))
# println(test1, typeof(test1), eltype(test1))
println(all(a10 .== test1))

o4 = ones(Int, 4)
test2 = [3 4 1 1 0 0 0 1 1 4; 4 3 4 1 1 0 0 0 1 1; 1 4 3 4 1 1 0 0 0 1; 1 1 4 3 4 1 1 0 0 0; 0 1 1 4 3 4 1 1 0 0; 0 0 1 1 4 3 4 1 1 0; 0 0 0 1 1 4 3 4 1 1; 1 0 0 0 1 1 4 3 4 1; 1 1 0 0 0 1 1 4 3 4; 4 1 1 0 0 0 1 1 4 3]

# println(o4, typeof(o4), eltype(o4))
# println(polynomial(o4, a10))
println(all(polynomial(o4, a10) .== test2))

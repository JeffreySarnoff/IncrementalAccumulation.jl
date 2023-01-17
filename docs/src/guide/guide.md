# Guide

To obtain the result of a predefined incremental statistic over some vector v
```
xs = collect(1:10);
accsum = AccSum(eltype(xs))

function accumulate(acc, xs)
    result = Vector{eltype(xs)}(undef, length(xs))
    @inbounds for i in eachindex(result)
        result[i] = acc(xs[i])()    # note the trailing `()`
    end
    result
end

result = accumulate(accsum, xs)

julia> result = accumulate(accsum, xs)
10-element Vector{Int64}:
  1
  3
  6
 10
 15
 21
 28
 36
 45
 55
 ```
 
Note that using `eltype(xs)` where xs are Ints will not work where the function generates floats.
In such cases, using `Acc_()` will default to `Float64` and using `Acc_(Float32)` will use `Float32s`.

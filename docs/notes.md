```

julia> mat
3×3 Matrix{Int64}:
 1  4  7
 2  5  8
 3  6  9

julia> 7+8+9
24

julia> accsum1 = AccSum(Int); accsum2 = AccSum(Int); accsum3 = AccSum(Int); accsums = (accsum1, accsum2, accsum3);

julia> map((acc,col)->map(acc,col), accsums, cols)
3-element Vector{Vector{AccSum{Int64, typeof(identity)}}}:
 [AccSum{Int64, typeof(identity)}(3, 6, identity), AccSum{Int64, typeof(identity)}(3, 6, identity), AccSum{Int64, typeof(identity)}(3, 6, identity)]
 [AccSum{Int64, typeof(identity)}(3, 15, identity), AccSum{Int64, typeof(identity)}(3, 15, identity), AccSum{Int64, typeof(identity)}(3, 15, identity)]
 [AccSum{Int64, typeof(identity)}(3, 24, identity), AccSum{Int64, typeof(identity)}(3, 24, identity), AccSum{Int64, typeof(identity)}(3, 24, identity)]

julia> accsums[3]()
24
```

```
missing_to_last(x, s) = ismissing(x) ? s() : x
missing_to_zero(x, s) = ismissing(x) ? zero(x) : x
missing_to_one(x, s) = ismissing(x) ? one(x) : x

nan_to_last(x, s) = isnan(x) ? s() : x
nan_to_zero(x, s) = isnan(x) ? zero(x) : x

to_last(x, s) = ismissing(x) || isnan(x) ? s() : x

accsum = AccSum(Union{Missing,Int}; fn=x->fna(x, accsum))
accstd = AccStd(Union{Missing,Float32}; fn=x->fna(x, accstd))


macro string(x)
    :($(esc(string(x))))
end

macro lcstring(x)
    :($(esc(lowercase(string(x)))))
end

macro symbol(x)
    Symbol(@string($x))
end

macro lcsymbol(x)
    :(Symbol(@lcstring($x)))
end

macro assignsym(x)
  quote
    $(esc(x)) = AccSum(Union{Missing,Int}; fn=x->fna(x,$(esc(x))))
  end
end

macro assignacc(Acc, T)
  quote
    local accum = @lcsymbol($Acc)
    local Accum = $Acc
    accum = Accum($T; fn=x->fna(x, $esc(accum)))
  end
end

 @assignacc(AccSum, Int) # generates accsum
 
```

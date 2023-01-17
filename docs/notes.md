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

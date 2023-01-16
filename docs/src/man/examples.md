# examples.md

## Rolling minimum over Float32s
```
acc = AccMinimum(Float32)
```
#### this is the way to get each new result
```
results = similar(data)
@inbounds for i in eachindex(data)
    results[i] = acc(data[i])()
end
```
#### this is the way to get the final result only
```
acc(data)
```

##### either way gets you
```
final_minimum = acc()
count_minimums = acc.nmin
count_observations = acc.nobs
```

### Rolling meanabs over Float32s
```
fnx(x) = abs(x)

acc = AccMean(Float32; fn=fnx)
```

#### this is the way to get each new result
```
results = similar(data)
@inbounds for i in eachindex(data)
    results[i] = acc(data[i])()
end
```
#### this is the way to get the final result only
```
acc(data)
```

##### either way gets you
```
final_mean = acc()
count_observations = acc.nobs
```

### Rolling sum over Float32s with missings
- missing replaced with prior sum
```
fnx(x; acc=accsum) = ismissing(x) ? acc.min : x
```
- missing replaced with zero
```
fnx(x::T; acc=accsum) where {T} = ismissing(x) ? zero(T) : x

accsum = AccSum(Float32; fn=fnx)
```

#### this is the way to get each new result
```
results = similar(data)
@inbounds for i in eachindex(data)
    results[i] = accsum(data[i])()
end
```
#### this is the way to get the final result only
```
accsum(data)
```

##### either way gets you
```
final_sum = accsum()
count_observations = accsum.nobs
```


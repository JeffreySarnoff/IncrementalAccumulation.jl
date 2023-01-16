# examples.md

## Rolling minimum over Float32s
```
acc = AccMinimum(Float32)
```
### this is the way to get each new result
```
results = similar(data)
@inbounds for i in eachindex(data)
    results[i] = acc(data[i])()
end
```
### this is the way to get the final result only
```
acc(data)
```

#### either way gets you
```
final_minimum = acc()
count_minimums = acc.nmin
count_observations = acc.nobs
```

## Rolling sum over Float32s with missings
- missing replaced with prior sum
```
fnmin2(x; acc=acc) = ismissing(x) ? acc.min : x`
acc = AccSum(Float32; fn=fnmin2)
```

### this is the way to get each new result
```
results = similar(data)
@inbounds for i in eachindex(data)
    results[i] = acc(data[i])()
end
```
### this is the way to get the final result only
```
acc(data)
```

#### either way gets you
```
final_sum = acc()
count_observations = acc.nobs
```


using IncrementalAccumulators, Test

ints = collect(1:7)
floats = collect(1.0:7.0)

intsmixed = ints
intsmixed[6] = -intsmixed[6]

floatsmixed = floats
floatsmixed[6] = -floatsmixed[6]

intsmissing = Union{Missing,Int}[ints...]
intsmissing[3] = missing
intsmissing[4] = missing

floatsmissing = Union{Missing,Float64}[ints...]
floatsmissing[3] = missing
floatsmissing[4] = missing

cumsum_ints = cumsum(ints)
cumsum_floats = cumsum(floats)

cumsum_intsmixed = cumsum(intsmixed)
cumsum_floatsmixed = cumsum(floatsmixed)

accsum1 = AccSum(Int)
accsum2 = AccSum(Float64)

fnsum(acc::Accumulator, x) = ismissing(x) ? acc.sum : x

accsum = AccSum(Union{Missing, Float64}; fn=fnsum)


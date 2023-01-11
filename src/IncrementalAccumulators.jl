module IncrementalAccumulators

export Accumulator, Seq, seq,
       AccCount, 
       AccMinimum, AccMaximum, AccExtrema, 
       AccSum, AccProd,
       AccMean, AccGeoMean, AccHarmMean, AccGenMean,
       AccMeanAndVar, AccMeanAndStd, AccStats,
       AccExpWtMean, AccExpWtMeanVar, AccExpWtMeanStd

# external packages

using StatsBase, VectorizedStatistics

#= ---- functions and functors ---- =#

include("support.jl")
include("types.jl")

include("accumulators.jl")

end #  IncrementalAccumulators


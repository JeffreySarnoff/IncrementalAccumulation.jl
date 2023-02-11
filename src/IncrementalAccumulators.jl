module IncrementalAccumulators

export Accumulator, Seq, MultiSeq, seq,
       AccCount, 
       AccMinimum, AccMaximum, AccExtrema, 
       AccSum, AccProd,
       AccMean, AccGeoMean, AccHarmMean, AccGenMean,
       AccMeanAndVar, AccMeanAndStd, AccStats,
       AccExpWtMean, AccExpWtMeanAndVar, AccExpWtMeanAndStd

# external packages

using StatsBase, VectorizedStatistics

#= ---- functions and functors ---- =#

include("support.jl")
include("types.jl")

include("accumulators.jl")

end #  IncrementalAccumulators


module IncrementalAccumulators

using StatsBase, VectorizedStatistics

"""
    Accumulator{T,F}
""" 
abstract type Accumulator{T,F} <: Function end

#= ---- generalized sequence ---- =#

"""
    Seq
"""
const Seq = Union{AbstractArray{T,N},NTuple{N,T}} where {N,T}

"""
    seq
"""
seq(x::AbstractArray{T,N}) where {N,T} = x
seq(x::NTuple{N,T}) where {N,T} = x

#= ---- Julia code ---- =#

include("support.jl")
include("accumulators.jl")

end #  IncrementalAccumulators


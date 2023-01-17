#= ---- abstract types ---- =#

"""
    Accumulator{T,F}
"""
Accumulator

abstract type Accumulator{T,F} <: Function end

#= ---- generalized sequence ---- =#

"""
    Seq
"""
const Seq1 = Union{AbstractVector{T}, NTuple{N,T}} where {N,T}
const Seq = Union{AbstractArray{T,N},NTuple{N,T}} where {N,T}

"""
    seq
"""
seq(x::AbstractArray{T,N}) where {N,T} = x
seq(x::NTuple{N,T}) where {N,T} = x


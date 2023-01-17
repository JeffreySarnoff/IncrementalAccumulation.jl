const AccNum = Float64

# from within a Union
@inline union_types(x::Union) = (x.a, union_types(x.b)...)
@inline union_types(@nospecialize x::Type) = (x,)
@inline union_common(x::Union) = setdiff(union_types(x),(Missing,Nothing))
@inline commontype(@nospecialize x::Union) = union_common(x)[1]
@inline commontype(::Type{T}) where {T} = T


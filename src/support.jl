const AccNum = Float64

# from within a Union
union_types(x::Union) = (x.a, union_types(x.b)...)
union_types(x::Type) = (x,)
union_common(x::Union) = setdiff(union_types(T),(Missing,Nothing))
commontype(x::Union) = union_common(x)[1]
commontype(::Type{T}) where {T} = T


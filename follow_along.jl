struct IntModN <: Integer
    value::Int
    modulus::Int
end

import Base.show
show(io::IO, x::IntModN) = print(io, "IntModN($(x.value) mod $(x.modulus))")

IntModN(10,3)

struct MismatchedModulusException <: Exception
    first::IntModN
    second::IntModN
end





struct Squares
    max::Int
end

import Base.iterate

iterate(::Squares) = (1,2)
iterate(s::Squares, i::Int) = if i> s.max
    nothing
else
    (i^2, i+1)
end

square = Squares(5)

iterate(square)

for i in square
    println(i)
end
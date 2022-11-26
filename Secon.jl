struct Coordinate{T1 <: AbstractFloat, T2 <: AbstractFloat}
    x::T1
    y::T2
end

import Base:+, -, *

+(a::Coordinate, b::Coordinate) = Coordinate(a.x + b.x, a.y + b.y)
-(a::Coordinate, b::Coordinate) = Coordinate(a.x - b.x, a.y - b.y)
*(λ::Real, a::Coordinate) = Coordinate(λ*a.x, λ*a.y)

first = Coordinate(0.1, 2.4)
second = Coordinate(0.2, 0.2)

@code_warntype(4//2*second)

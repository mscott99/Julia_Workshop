#iterate over primes State will be the value of the last prime +1
#need to know all the previous primes in the state as well

mutable struct PrimeState{T<:Integer, Q<:AbstractArray{T}}
    index::T
    previousPrimes::Q
end
PrimeState(count::T) where T<:Integer = PrimeState(count, typeof(count)[])


struct PrimeIterand{T<: Integer}
    max::T
end

import Base.iterate

function iterate(iterand::PrimeIterand, state::PrimeState = PrimeState(1))
    startagain = false
    while true

        if state.index > iterand.max
            return nothing
        end
        for prevprime in state.previousPrimes
            if prevprime != 1 && state.index % prevprime == 0
                #not a prime
                state.index += 1

                startagain =true
                break 
            end
        end
        if startagain
           startagain=false
           continue 
        end
        # is a prime
        push!(state.previousPrimes, state.index)
        state.index +=1
        return (state.index -1 , state)
    end
end

for i in PrimeIterand(1_000_000)
    @show i
end

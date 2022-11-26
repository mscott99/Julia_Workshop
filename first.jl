
function guessingGame(gameRange)
    hiddenNum = rand(gameRange)
    println("Guess a number in ", gameRange)
    for count in  1:ceil(log(2, length(gameRange)))
        guess =readline()
        guess = parse(Int, guess)
        if guess > 100 || guess ≤ 0
            println("Guess not in range, try again")
        elseif guess > hiddenNum
            println("Too high!")
        elseif guess < hiddenNum
            println("Too low!")
        else
            println("success!!! You are a champion")
            return
        end
    end
    println("Failure through bad guesses")
end

guessingGame(1:25)
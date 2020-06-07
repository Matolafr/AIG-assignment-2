
grid = zeros(Int,9)

#grid[5] = 1
#grid[1] = -1
grid[9] = 1
grid[2] = -1

function winner(grid)
    if (grid[1] == grid[2] == grid[3] == 1)
        return 1
    elseif (grid[1] == grid[2] == grid[3] == -1)
        return -1
    elseif (grid[4] == grid[5] == grid[6] == 1)
        return 1
    elseif (grid[4] == grid[5] == grid[6] == -1)
        return -1
    elseif (grid[7] == grid[8] == grid[9] == 1)
        return 1
    elseif (grid[7] == grid[8] == grid[9] == -1)
        return -1
    elseif (grid[1] == grid[4] == grid[7] == 1)
        return 1
    elseif (grid[1] == grid[4] == grid[7] == -1)
        return -1
    elseif (grid[2] == grid[5] == grid[8] == 1)
        return 1
    elseif (grid[2] == grid[5] == grid[8] == -1)
        return -1
    elseif (grid[3] == grid[6] == grid[9] == 1)
        return 1
    elseif (grid[3] == grid[6] == grid[9] == -1)
        return -1
    elseif (grid[1] == grid[5] == grid[9] == 1)
        return 1
    elseif (grid[1] == grid[5] == grid[9] == -1)
        return -1
    elseif (grid[3] == grid[5] == grid[7] == 1)
        return 1
    elseif (grid[3] == grid[5] == grid[7] == -1)
        return -1
    else return 0
    end
end

function minimax(grid, who)
    result = winner(grid)
    if (result != 0)
        return result
    end
    besti = -10*who
    for i = 1:9
        if grid[i] == 0
            grid[i] = -who
            score = minimax(grid, -who)
            grid[i] = 0
            besti = max(who*besti,who*score)
            # responsible of the a-b-pruning (-1 is the worst result possible)
            if (score == -1)
                return besti
            end
        end
    end
    return besti
end

who = 1
tick = 1
while tick == 1
    print(grid[1:3],"\n",grid[4:6],"\n",grid[7:9],"\n\n")
    old = -10
    for i = 1:9
        if grid[i] == 0
            global grid[i] = who
            score = minimax(grid, who)
            if score > old
                #print(score, "\n")
                old = score
                global ind = i
            end
            global grid[i] = 0
        end
    end
    if (grid[ind]!=0)
        print("It's a tie.\n\n")
        return
    end
    global grid[ind] = who
    global who = -who
    if (winner(grid) != 0)
        global tick = 0
        print(grid[1:3],"\n",grid[4:6],"\n",grid[7:9],"\n\n")
        print("Winner is: ", winner(grid), "\n")
    end
end

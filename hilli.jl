
names = ["saku","olvi","lappari","koff","karhu","windhoek","karjala","keisari"]
amounts = [24,18,6,24,8,1,100,1000]
values = [-4,5,3,2,1,10,1,4]
weights = [1,1,1,1,1,2,5,10]

sizet = size(names)[1]

limit = 20

current_amounts = zeros(Int, sizet)


helper = floor.(limit./weights)

rty = helper.<amounts
kaik = rty.*helper + (helper.>amounts).*amounts

tick = 1

while tick == 1
    randia = rand(Float64, sizet)
    attempt = floor.(Int, randia.*kaik./2)
    #println(total_weight_value(attempt, weights), "\n")
    if sum(attempt.*weights) <= limit
        global current_amounts = attempt
        global tick = 0
    end
end

print("\nThe initial configuration is:\n",names,"\n",current_amounts,
"\nWith a total weight of ",sum(current_amounts.*weights)," and a value of ",
sum(current_amounts.*values),"\n")

newi = zeros(Int, sizet)

for i = 1:sizet
    apu = 1
    global newi = zeros(Int, sizet)
    while apu == 1
        global newi = copy(current_amounts)
        # check whether we should add or remove an item
        if ((values[i] > 0) && (current_amounts[i]<kaik[i]))
            global newi[i] = newi[i] + 1
        elseif ((values[i] < 0) && (current_amounts[i] > 0))
            global newi[i] = newi[i] - 1
        else apu = 0
        end
        #print("newi\n")
        #print(newi,"\n\n")
        # check that the weight doesnt exceed the limit (and that the value
        # doesnt decrease, not actually required here)
        if (sum(newi.*weights) <= limit) #&& (sum(newi.*values) > sum(current_amounts.*values)))
            global current_amounts[i] = newi[i]
            println("\nUpdated:\n",names,"\n",current_amounts,
            "\nWith a total weight of ",sum(current_amounts.*weights),
            " and a value of ",sum(current_amounts.*values))
        else
            apu = 0
        end
    end
end

print("\nThe final configuration is:\n",names,"\n",
current_amounts,"\nWith a total weight of ",sum(current_amounts.*weights),
" and a value of ",sum(current_amounts.*values))

print("\nend")

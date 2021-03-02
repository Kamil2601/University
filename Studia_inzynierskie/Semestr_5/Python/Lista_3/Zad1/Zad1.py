
def mandates(election_result,n):
    votes = {comitee : sum(election_result[comitee].values()) for comitee in election_result.keys()}
    votes_sum = sum(votes.values())
    
    for comitee in votes.keys():
        if votes[comitee]/votes_sum < 0.05:
            votes[comitee] = 0

    temp = votes.copy()

    mandates_count = {comitee : 0 for comitee in election_result.keys()}

    for i in range(n):
        c = max(temp,key=temp.get)
        mandates_count[c]+=1
        temp[c]=votes[c]/(mandates_count[c]+1)

    elects = {}

    for comitee in votes.keys():
        mandates = mandates_count[comitee]
        if mandates > 0:
            sorted_list = sorted(election_result[comitee].items(),
                key=lambda person : person[1],reverse=True)
            elects[comitee] = [candidate[0] for candidate in sorted_list[:mandates]]


    return elects


result1 = {
    "Komitet A" : {"Kandydat 1" : 132, "Kandydat 2" : 73, "Kandydat 3" : 65, "Kandydat 4" : 24, "Kandydat 5" : 40},
    "Komitet B" : {"Kandydat 1" : 20, "Kandydat 2" : 151, "Kandydat 3" : 33, "Kandydat 4" : 12, "Kandydat 5" : 55},
    "Komitet C" : {"Kandydat 1" : 92, "Kandydat 2" : 54, "Kandydat 3" : 32, "Kandydat 4" : 19, "Kandydat 5" : 12},
    "Komitet D" : {"Kandydat 1" : 20, "Kandydat 2" : 20, "Kandydat 3" : 10, "Kandydat 4" : 5, "Kandydat 5" : 0},
}

result2 = {
    "A" : {1 : 25, 2 : 35},
    "B" : {1 : 30, 2 : 5}
}


print(mandates(result1,5))
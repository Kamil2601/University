def compression(text):
    n = len(text)
    count = 1
    result = ""
    for i in range(1,n):
        if text[i]==text[i-1]:
            count+=1
        elif count > 1:
            result += str(count) + text[i-1]
            count = 1
        else:
            result += text[i-1]

    if count > 1:
        result += str(count) + text[n-1]
    else:
        result += text[n-1]

    return result

def decompression(text):
    result = ""
    number = ""
    n = len(text)
    for i in range(n):
        if text[i].isnumeric():
            number += text[i]
        elif number != "":
            result += int(number)*text[i]
            number = ""
        else:
            result += text[i]

    return result

test1 = "abcdddd"
test2 = "qwertyuiopasdfghhhhhhhhh"
test3 = "qqwweerrttyyuuiioopp"
test4 = "aaaaaaaaaaabbbbbbbbbbbbccccccccccccc"

print(compression(test1))
print(compression(test2))
print(compression(test3))
print(compression(test4))

print()

print(decompression(compression(test1)))
print(decompression(compression(test2)))
print(decompression(compression(test3)))
print(decompression(compression(test4)))


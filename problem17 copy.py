lengths = {
    0 : 0,
    1 : 3,
    2 : 3,
    3 : 5,
    4 : 4,
    5 : 4,
    6 : 3,
    7 : 5,
    8 : 5,
    9 : 4,
    10 : 3,
    11 : 6,
    12 : 6,
    13 : 8,
    14 : 8,
    15 : 7,
    16 : 7,
    17 : 9,
    18 : 8,
    19 : 8,
    20 : 6,
    30 : 6,
    40 : 5,
    50 : 5,
    60 : 5,
    70: 7,
    80 : 6,
    90 : 6,
    100 : 7,
    1000 : 8
}

total = 0

def split_num(num):
    if num == 1000:
        return [1000]
    
    length = len(str(num))
    nums = []
    
    if int(str(num)[-2:]) > 10 and int(str(num)[-2:]) < 20:
        nums.append((num // 100) * 100)
        nums.append(int(str(num)[-2:]))
    else:
        for i in range(length-1, -1, -1):
            nums.append(((num // 10**i) * 10**i) % 10**(i+1))
    
    nums = [i for i in nums if i != 0]
    return nums


def letters(num):
    for i in reversed(lengths):
        if i == 0:
            continue
        if num == i:
            return lengths[i]
        elif num % i == 0:
            return lengths[i] + lengths[num // i]

for i in range(1,1000):
    nums = split_num(i)
    num = 0
    if sum(nums) > 100 and sum(nums) % 100 != 0:
        num +=3
    for j in nums:
        if j >= 100 and j < 200:
            num+=3
        num += letters(j)
    total += num
    print(sum(nums),nums,num)

print(total+11)





# task10
# a = 'mandakh university'
# c = 0
# for i in a:
#     if (i == 'i'):
#         c += 1
# print(c)


# # task9
# name = 'bat|bold|suren'
# names = ''
# for i in name:
#     if i != '|':
#         names += i
#     else:
#         print(names)
#         names = ''
# print(names)

# # task8
# carPrice = ['$2500', '$35500', '$17500', '$4000']
# carTug = []
# for i in range(len(carPrice)):
#     carTug.append(int(carPrice[i][1:])*3300)
# print(carTug)

# task7
# rD = input('Регистрээ оруулна уу!: ')
# fName = input('Овог нэрээ оруулна уу!: ')


# def task7(rD, fName):
#     ognoo = f'19{rD[2: -6]}-{rD[4: -4]}-{rD[6:-2]}'

#     index = 0
#     for i in range(len(fName)):
#         if fName[i] == ' ':
#             index = i
#     ovogNer = f'{fName[0]}.{fName[index:]}'
#     fullOvogNer = f'{fName[:index]} овогтой {fName[index:]}'
#     return ognoo, ovogNer, fullOvogNer


# res = task7(rD, fName)
# print(res)


# task6 MS sum

# # task5

# a = input('Ymar neg yum bich nuu:  ')
# if a[0:] == a[::-1]:
#     print(f'{a}: палиндром мөн')
# else:
#     print(f'{a}: палиндром биш')


# # # task4
x = input('Хайх: ')
a = {'bad': "муу", 'good': 'сайн'}
print(a[x])
# def trans(x):
#     t = ''
#     if x == 'bad' or x == 'Bad':
#         t = 'bad --- Муу'
#     elif x == 'Муу' or x == 'муу':
#         t = 'муу --- bad'
#     elif x == 'good' or x == 'Good':
#         t = 'good --- Сайн'
#     elif x == 'Сайн' or x == 'сайн':
#         t = 'сайн --- good'
#     elif x == 'Улаан' or x == 'улаан':
#         t = 'улаан --- red'
#     elif x == 'red' or x == 'Red':
#         t = 'red --- улаан'

#     elif x == 'This is computer':
#         t = f'{x} --- Энэ бол компьютер'
#     elif x == 'Энэ бол компьютер':
#         t = f'{x} --- This is computer'
#     elif x == 'Hello':
#         t = f'{x} --- Сайн байн уу'
#     elif x == 'Сайн байн уу':
#         t = f'{x} --- Hello'
#     elif x == 'How are you?':
#         t = f'{x} --- Сонин юу байна?'
#     elif x == 'Сонин юу байна?':
#         t = f'{x} --- How are you?'
#     else:
#         t = (f'{x} --- илэрц олдсонгүй')

#     return t


# res = trans(x)
# print(res)


# # task3
# u = 'abcdefkjyhtgnbgrspoikjabcdefkjyhtgnbgrspoikjabcdefkjyhtgnbgrspoikjabcdefkjyhtgnbgrspoikjgkdljfhgkdfhgkld'
# def tooloh(u):
#     a = 0
#     b = 0
#     c = 0
#     d = 0
#     e = 0
#     for i in u:
#         if i == 'a':
#             a += 1
#         if i == 'b':
#             b += 1
#         if i == 'c':
#             c += 1
#         if i == 'd':
#             d += 1
#         if i == 'e':
#             e += 1
#     return a, b, c, d, e


# res = tooloh(u)
# print(f'a: {res[0]}\nb: {res[1]}\nc: {res[2]}\nd: {res[3]}\ne: {res[4]}')

# task2
# a = 'hello world'
# s = 0
# for i in a:
#     s += 1
# print(f'Урт: {s}')


# # task1
# try:
#     a = int(input('1dehi toog oruulna uu! '))
#     b = int(input('2dahi toog oruulna uu! '))
#     c = int(input('3dahi toog oruulna uu! '))

#     def litMid(a, b, c):
#         lit = a
#         if b < a and b < c:
#             lit = b
#         if c < b and c < a:
#             lit = c
#         lot = a
#         if b > a and b > c:
#             lot = b
#         if c > b and c > a:
#             lot = c
#         mid = (a+b+c)/3
#         return lit, mid, lot

#     res = litMid(a, b, c)
#     print(f'Бага тоо: {res[0]} \nДундаж тоо: {res[1]} \nИх тоо: {res[2]}')
# except ValueError:
#     print('Зөвхөн тоо оруулна уу!')
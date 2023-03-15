import random, string
datetime_f = '%Y-%m-%d %H:%M'
def randomword(length):
   letters = string.ascii_uppercase
   return ''.join(random.choice(letters) for i in range(length))


def str_datetime(date):
    date = date.replace('%3A', ':')
    date = date.replace('T', ' ')
    return date
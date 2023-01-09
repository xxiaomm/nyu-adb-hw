import sys
import math
import csv
import numpy as np
from tqdm import trange
from numpy import random

min_price = 50
max_price = 500
min_quantity = 100
max_quantity = 10000
max_symbols = 100000
max_trade_rows = 10000000

def gen_price(pre):
    choices = [pre-1,pre-2, pre-3, pre-4, pre-5, pre+1, pre+2, pre+3, pre+4, pre+5]
    price = random.choice(choices)  # choose from choices randomly

    if min_price <= price <= max_price:
        return price

    return gen_price(pre)


def gen(frac, n):
    p = np.array(list(range(1,n+1))) # np: fast
    random.shuffle(p) # reorder
    outvec = p

    while len(p) > 1:
        p = p[:math.floor(len(p) * frac)]
        # outvec = outvec + p  # very slow....
        outvec = np.concatenate((outvec, p))

    random.shuffle(outvec)
    return outvec

def gen_trade_table(stocksymbol, n):
    print("Generate trade table...... ")
    trade_table = list()
    dic = dict() # store the current price of this stocksymbol
    for time in trange(n):
        curr = random.choice(stocksymbol)
        quantity = random.randint(min_quantity, max_quantity)

        if curr in dic.keys():
            price = gen_price(dic[curr])
        else: 
            price = random.randint(min_price, max_price)

        dic[curr] = price
        trade_table.append([curr, time+1, quantity, price])
    print("Trade table generated! ")
    return trade_table
    

def gen_file(trade_table, filename):
    print("Writing file......")
    with open(filename, 'w') as file:
        writer = csv.writer(file)
        writer.writerow(["stocksymbol", "time", "quantity", "price"])
        for i in trange(len(trade_table)):
            writer.writerow(trade_table[i])

    print('Writing file has finished!')


if __name__ == '__main__':
    if len(sys.argv) != 2:
        print("Usage:\n python3 trade.py <output_filename.csv>.")
        exit(0)
    stocksymbol = gen(0.3, 70002)
    print('the length of stocksymbol: ', len(stocksymbol))
    
    trade_table = gen_trade_table(stocksymbol, max_trade_rows)
    print('the length of trade_table: ', len(trade_table))
    gen_file(trade_table, sys.argv[1])

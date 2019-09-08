#!/home/haileong/anaconda3/bin/python3
from igraph import Graph
import random
import argparse

dic = dict()

def write(g):
    assert type(g)==Graph
    global misses
    misses = g.largest_independent_vertex_sets();
    siz = len(misses[0])
    misVertices = set()
    for mis in misses:
        misVertices = misVertices.union(mis)
    #a = siz>g.vcount()//4
    #b = siz>g.vcount()//2
    var = siz//5
    s = '%d %d\n' % (g.vcount(), var)
    if var not in dic: dic[var] = 1
    else: dic[var]+=1
    for v in range(g.vcount()):
        adj = g.neighbors(v)
        s += "%d %d %s\n" % (v in misVertices, len(adj), str(adj).replace(',','')[1:-1])
    return s


parser = argparse.ArgumentParser(description='Generate MIS input for the GIN code to parse')
def SType(s):
    s = int(s)
    if s>300:
        raise argparse.ArgumentTypeError('Program will take too long to run if s>300')
    return s

parser.add_argument('-n', '--number_of_graphs', metavar='number', type=int, default=100, 
                    help='Number of graphs in file')
parser.add_argument('-s', '--size_of_graph', metavar='size', type=SType, default=40,
                    help='the size of each and every graph')
args = parser.parse_args() 
print(args.number_of_graphs, args.size_of_graph)

for i in range(args.number_of_graphs):
    g = Graph.GRG(args.size_of_graph,random.random()*0.7+0.15)
    print(write(g),end='')

for i,v  in dic.items():
    print('# %2d: %d' % (i,v) )
'''

g = Graph.GRG(10,0.5)
print(str(g.vs()))'''

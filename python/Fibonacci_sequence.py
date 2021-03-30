#-------------------------------------------------------------------------------
# Name    : fibonacci-sequence
# Comment : based on https://rosettacode.org
#-------------------------------------------------------------------------------

from timeit import default_timer as timer
from datetime import timedelta

def fibIter(n):
    if n < 2:
        return n
    fibPrev = 1
    fib = 1
    for num in range(2, n):
        fibPrev, fib = fib, fib + fibPrev
    return fib

def dofib(n):
    print("run: " + str(n))
    for i in range(0,30):print(fibIter(i))

start = timer()
for i in range(1,100): dofib(i)
end = timer()
print(timedelta(seconds=end-start))
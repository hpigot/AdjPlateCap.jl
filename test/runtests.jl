using Test, Random, AdjPlateCap

e2 = 99*rand() + 1
e3 = 99*rand() + 1
h2 = 1e-4*(999*rand() + 1)
h3 = 1e-4*(999*rand() + 1)
w = 1e-3*(999*rand() + 1)
s = 1e-3*(999*rand() + 1)
x = 1e-3*(999*rand() + 1)

@test capacitance(e2,e3,h2,h3,0,s,x) == 0.0 #zero plate length
@test capacitance(e2,e3,h2,h3,w,s,0) == 0.0 #zero plate width

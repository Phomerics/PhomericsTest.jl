f1(x,y) = x + y
f2(x,y) = 2x + 2y
f_diff2(x,y) = ForwardDiff.derivative(x->f2(x,y),x)

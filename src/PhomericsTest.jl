module PhomericsTest

using ForwardDiff    # used in my_test_functions.jl
using SparseArrays   # used in CalcD.jl


include("my_test_functions.jl")
export f1
export f2
export f_diff2

include("CalcD.jl")

end # module

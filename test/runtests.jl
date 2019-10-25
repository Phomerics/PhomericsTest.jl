using SafeTestsets
@safetestset "my f tests" begin include("f_tests.jl") end
@safetestset "my Operators tests" begin include("Operators_tests.jl") end
@safetestset "my Operators tests" begin include("Tools_tests.jl") end

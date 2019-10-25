using PhomericsTest
using Test

@testset "Tools.jl" begin
    x = collect(0:5)
    y = x.^2

    @test first_derivative(x,y) == [1.00, 3.00, 5.00, 7.00, 9.00]
end

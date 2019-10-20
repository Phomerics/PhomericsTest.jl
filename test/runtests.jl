using PhomericsTest
using Test

f_diff2(1,2)

@testset "PhomericsTest.jl" begin
    @test f2(1,2) == 6
    @test f2(10,10) == 40
end

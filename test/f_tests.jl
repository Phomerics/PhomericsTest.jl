using PhomericsTest
using Test

@testset "PhomericsTest.jl" begin
    @test f2(1,2) == 6
    @test f2(10,10) == 40
    @test f_diff2(1,2) == 2
    @test f1(1,1) == 2
end

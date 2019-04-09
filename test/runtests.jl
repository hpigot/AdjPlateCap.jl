using Test, AdjPlateCap

@test capacitance(4,80,0.5e-3,1e-2, 0, 1e-3, 12.7e-3) == 0.0
@test capacitance(4,80,0.5e-3,1e-2, 100e-3, 1e-3, 0) == 0.0
## make exception for @test capacitance(4,80,0.5e-3,1e-2, 100e-3, 0, 12.7e-3)

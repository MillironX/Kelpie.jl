using Documenter
using Kelpie
using Test

DocMeta.setdocmeta!(Kelpie, :DocTestSetup, :(using Kelpie); recursive=true)

@testset "Kelpie.jl" begin
    @testset "Doctests" begin
        doctest(Kelpie)
    end #testset
end #testset

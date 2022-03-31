using Kelpie
using Documenter

DocMeta.setdocmeta!(Kelpie, :DocTestSetup, :(using Kelpie); recursive=true)

makedocs(;
    modules=[Kelpie],
    authors="Thomas A. Christensen II <25492070+MillironX@users.noreply.github.com> and contributors",
    repo="https://github.com/MillironX/Kelpie.jl/blob/{commit}{path}#{line}",
    sitename="Kelpie.jl",
    format=Documenter.HTML(;
        prettyurls=get(ENV, "CI", "false") == "true",
        canonical="https://MillironX.github.io/Kelpie.jl",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)

deploydocs(;
    repo="github.com/MillironX/Kelpie.jl",
    devbranch="master",
)

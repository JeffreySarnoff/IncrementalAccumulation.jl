using Documenter, DocumenterTools, IncrementalAccumulators

makedocs(
    modules = [IncrementalAccumulators],
    sitename = "IncrementalAccumulators.jl",
    authors = ["Jeffrey Sarnoff <jeffrey.sarnoff@gmail.com>", "other contributors"],
    format=Documenter.HTML(
        # Use clean URLs, unless built as a "local" build
        prettyurls=!("local" in ARGS),
        highlights=["yaml"],
        ansicolor=true,
    ),
    pages = [
        "Home" => "index.md",
        "Guide" => Any[
            "guide/guide.md",
            "Examples" => "guide/examples.md",
        ],
        "Manual" => Any[
            "man/predefined.md",
            "man/rollandrun.md",
        ],
        "contributing.md",
        "citing.md",
    ],
)

deploydocs(
    repo = "github.com/JeffreySarnoff/IncrementalAccumulators.jl.git",
    target = "build"
)


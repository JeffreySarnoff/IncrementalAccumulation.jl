using Documenter, DocumenterTools, IncrementalAccumulators

makedocs(
    modules = [IncrementalAccumulators],
    sitename = "IncrementalAccumulators.jl",
    authors = ["Jeffrey Sarnoff <jeffrey.sarnoff@gmail.com>", "and contributors"],
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
    push_preview = true,
)


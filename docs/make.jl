using Documenter, DocumenterTools, IncrementalAccumulators

makedocs(
    modules = [IncrementalAccumulators],
    sitename = "IncrementalAccumulators.jl",
    authors = ["Jeffrey Sarnoff <jeffrey.sarnoff@gmail.com>", "and contributors"],
    pages = [
        "Home" => "index.md",
        "Manual" => Any[
            "Guide" => "man/guide.md",
            "man/examples.md",
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


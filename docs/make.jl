using Documenter, DocumenterTools

makedocs(
    modules = [IncrementalAccumulators],
    format = if "pdf" in ARGS
        IncrementalAccumulators.LaTeX(platform = "docker")
    else
        IncrementalAccumulators.HTML(
            # Use clean URLs, unless built as a "local" build
            prettyurls = !("local" in ARGS),
            canonical = "https://juliadocs.github.io/IncrementalAccumulators.jl/stable/",
            assets = ["assets/favicon.ico"],
            analytics = "UA-136089579-2",
            highlights = ["yaml"],
            ansicolor = true,
        )
    end,
    build = ("pdf" in ARGS) ? "build-pdf" : "build",
    debug = ("pdf" in ARGS),
    clean = false,
    sitename = "IncrementalAccumulators.jl",
    authors = "Jeffrey Sarnoff and contributors",
    pages = [
        "Home" => "index.md",
        "Manual" => Any[
            "Guide" => "man/guide.md",
            "man/examples.md",
        ],
        "contributing.md",
    ],
    strict = !("strict=false" in ARGS),
    doctest = ("doctest=only" in ARGS) ? :only : true,
)

if "pdf" in ARGS
    # hack to only deploy the actual pdf-file
    mkpath(joinpath(@__DIR__, "build-pdf", "commit"))
    let files = readdir(joinpath(@__DIR__, "build-pdf"))
        for f in files
            if startswith(f, "IncrementalAccumulators.jl") && endswith(f, ".pdf")
                mv(joinpath(@__DIR__, "build-pdf", f),
                joinpath(@__DIR__, "build-pdf", "commit", f))
            end
        end
    end
    deploydocs(
        repo = "github.com/JeffreySarnoff/IncrementalAccumulators.jl.git",
        target = "pdf/build-pdf/commit",
        branch = "gh-pages-pdf",
        forcepush = true,
    )
else
    deploydocs(
        repo = "github.com/JeffreySarnoff/IncrementalAccumulators.jl.git",
        target = "build",
        push_preview = true,
    )
end


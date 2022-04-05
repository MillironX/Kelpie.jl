using Documenter
using EzXML: AttributeNode, ElementNode, HTMLDocumentNode, TextNode, link!, prettyprint
using Kelpie
using Suppressor
using Test

# Set up doctests
DocMeta.setdocmeta!(Kelpie, :DocTestSetup, :(using Kelpie); recursive=true)

# Set up the Bootstrap 5.1.3 starter template in EzXML nodes
function bootstrap_starter()
    # Create the nodes
    doc_node = HTMLDocumentNode("about:legacy-compat", nothing)
    html_node = ElementNode("html")
    head_node = ElementNode("head")
    meta_charset_node = ElementNode("meta")
    meta_viewport_node = ElementNode("meta")
    css_link_node = ElementNode("link")
    title_node = ElementNode("title")
    body_node = ElementNode("body")
    h1_node = ElementNode("h1")
    script_node = ElementNode("script")

    # Add attributes
    link!(html_node, AttributeNode("lang", "en"))
    link!(meta_charset_node, AttributeNode("charset", "utf-8"))
    link!(meta_viewport_node, AttributeNode("name", "viewport"))
    link!(
        meta_viewport_node, AttributeNode("content", "width=device-width, initial-scale=1")
    )
    link!(
        css_link_node,
        AttributeNode(
            "href",
            "https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css",
        ),
    )
    link!(css_link_node, AttributeNode("rel", "stylesheet"))
    link!(
        css_link_node,
        AttributeNode(
            "integrity",
            "sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3",
        ),
    )
    link!(css_link_node, AttributeNode("crossorigin", "anonymous"))
    link!(
        script_node,
        AttributeNode(
            "src",
            "https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js",
        ),
    )
    link!(
        script_node,
        AttributeNode(
            "integrity",
            "sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p",
        ),
    )
    link!(script_node, AttributeNode("crossorigin", "anonymous"))

    # Add content
    link!(title_node, TextNode("Hello, world!"))
    link!(h1_node, TextNode("Hello, world!"))
    link!(script_node, TextNode(""))

    # Link the tree together
    link!(head_node, meta_charset_node)
    link!(head_node, meta_viewport_node)
    link!(head_node, css_link_node)
    link!(head_node, title_node)
    link!(body_node, h1_node)
    link!(body_node, script_node)
    link!(html_node, head_node)
    link!(html_node, body_node)
    link!(doc_node, html_node)

    return @capture_out prettyprint(doc_node)
end #function

@testset "Kelpie.jl" begin
    @testset "Doctests" begin
        doctest(Kelpie)
    end #testset
end #testset

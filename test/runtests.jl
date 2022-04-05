using Documenter
using EzXML: AttributeNode, ElementNode, HTMLDocumentNode, TextNode, link!, prettyprint
using Kelpie
using Suppressor
using Test

# Set up doctests
DocMeta.setdocmeta!(Kelpie, :DocTestSetup, :(using Kelpie); recursive=true)

prettystring(xml) = @capture_out prettyprint(xml)

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

    return prettystring(doc_node)
end #function

# Set up the Zurb Foundation 6.7.4 starter template in EzXML nodes
function foundation_template()
    # Create the nodes
    doc_node = HTMLDocumentNode("about:legacy-compat", nothing)
    html_node = ElementNode("html")
    head_node = ElementNode("head")
    meta_charset_node = ElementNode("meta")
    meta_http_equiv_node = ElementNode("meta")
    meta_viewport_node = ElementNode("meta")
    title_node = ElementNode("title")
    css_link_node = ElementNode("link")
    body_node = ElementNode("body")
    h1_node = ElementNode("h1")
    script_jquery_node = ElementNode("script")
    script_whatinput_node = ElementNode("script")
    script_foundation_node = ElementNode("script")
    script_launch_node = ElementNode("script")

    # Add attributes
    link!(html_node, AttributeNode("class", "no-js"))
    link!(html_node, AttributeNode("lang", "en"))
    link!(meta_charset_node, AttributeNode("charset", "utf-8"))
    link!(meta_http_equiv_node, AttributeNode("http-equiv", "x-ua-compatible"))
    link!(meta_http_equiv_node, AttributeNode("content", "ie=edge"))
    link!(meta_viewport_node, AttributeNode("name", "viewport"))
    link!(
        meta_viewport_node,
        AttributeNode("content", "width=device-width, initial-scale=1.0"),
    )
    link!(css_link_node, AttributeNode("rel", "stylesheet"))
    link!(
        css_link_node,
        AttributeNode(
            "href",
            "https://cdn.jsdelivr.net/npm/foundation-sites@6.7.4/dist/css/foundation.min.css",
        ),
    )
    link!(css_link_node, AttributeNode("crossorigin", "anonymous"))
    link!(
        script_jquery_node,
        AttributeNode(
            "src", "https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"
        ),
    )
    link!(script_jquery_node, AttributeNode("crossorigin", "anonymous"))
    link!(
        script_whatinput_node,
        AttributeNode(
            "src", "https://cdn.jsdelivr.net/npm/what-input@5.2.10/dist/what-input.min.js"
        ),
    )
    link!(script_whatinput_node, AttributeNode("crossorigin", "anonymous"))
    link!(
        script_foundation_node,
        AttributeNode(
            "src",
            "https://cdn.jsdelivr.net/npm/foundation-sites@6.7.4/dist/js/foundation.min.js",
        ),
    )
    link!(script_foundation_node, AttributeNode("crossorigin", "anonymous"))

    # Add content
    link!(title_node, TextNode("Foundation Starter Template"))
    link!(h1_node, TextNode("Hello, world!"))
    link!(script_jquery_node, TextNode(""))
    link!(script_whatinput_node, TextNode(""))
    link!(script_foundation_node, TextNode(""))
    link!(script_launch_node, TextNode("\$(document).foundation();"))

    # Link the tree together
    link!(head_node, meta_charset_node)
    link!(head_node, meta_http_equiv_node)
    link!(head_node, meta_viewport_node)
    link!(head_node, title_node)
    link!(head_node, css_link_node)
    link!(body_node, h1_node)
    link!(body_node, script_jquery_node)
    link!(body_node, script_whatinput_node)
    link!(body_node, script_foundation_node)
    link!(body_node, script_launch_node)
    link!(html_node, head_node)
    link!(html_node, body_node)
    link!(doc_node, html_node)

    return prettystring(doc_node)
end #function

@testset "Kelpie.jl" begin
    @testset "Doctests" begin
        doctest(Kelpie)
    end #testset

    @testset "Frameworks" begin
        bootstrap_kelpie = html(
            head(
                meta(; charset="utf-8"),
                meta(; name="viewport", content="width=device-width, initial-scale=1"),
                link(;
                    href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css",
                    rel="stylesheet",
                    integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3",
                    crossorigin="anonymous",
                ),
                title("Hello, world!"),
            ),
            body(
                h1("Hello, world!"),
                script(
                    "";
                    src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js",
                    integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p",
                    crossorigin="anonymous",
                ),
            );
            lang="en",
        )
        foundation_kelpie = html(
            head(
                meta(; charset="utf-8"),
                meta(; http_equiv="x-ua-compatible", content="ie=edge"),
                meta(; name="viewport", content="width=device-width, initial-scale=1.0"),
                title("Foundation Starter Template"),
                link(;
                    rel="stylesheet",
                    href="https://cdn.jsdelivr.net/npm/foundation-sites@6.7.4/dist/css/foundation.min.css",
                    crossorigin="anonymous",
                ),
            ),
            body(
                h1("Hello, world!"),
                script(
                    "";
                    src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js",
                    crossorigin="anonymous",
                ),
                script(
                    "";
                    src="https://cdn.jsdelivr.net/npm/what-input@5.2.10/dist/what-input.min.js",
                    crossorigin="anonymous",
                ),
                script(
                    "";
                    src="https://cdn.jsdelivr.net/npm/foundation-sites@6.7.4/dist/js/foundation.min.js",
                    crossorigin="anonymous",
                ),
                script("\$(document).foundation();"),
            );
            class="no-js",
            lang="en",
        )

        @test prettystring(bootstrap_kelpie) == bootstrap_starter()
        @test prettystring(foundation_kelpie) == foundation_template()
    end #testset

    @testset "Behaviors" begin
        # Test that attributes with underscores become attributes with dashes
        @test occursin("<i data-tooltip=\"foo\"/>", prettystring(i(; data_tooltip="foo")))
    end #testset
end #testset

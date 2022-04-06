module Kelpie

import EzXML: link!, EzXML

export html
export html_div
export html_element

const HTML_ELEMENTS = [
    :head,
    :link,
    :meta,
    :style,
    :title,
    :body,
    :article,
    :aside,
    :footer,
    :header,
    :h1,
    :h2,
    :h3,
    :h4,
    :h5,
    :h6,
    :main,
    :nav,
    :section,
    :blockquote,
    :dd,
    # :div, Special case: we don't want to override the Base.div function
    :dl,
    :dt,
    :hr,
    :li,
    :ol,
    :p,
    :ul,
    :a,
    :b,
    :br,
    :code,
    :em,
    :i,
    :span,
    :strong,
    :sub,
    :sup,
    :u,
    :img,
    :iframe,
    :script,
    :table,
    :tbody,
    :td,
    :tfoot,
    :th,
    :thead,
    :tr,
    :button,
]

"""
    link_or_text!(node, content...)

Converts each `content` to an `EzXML.TextNode` if it isn't already an `EzXML.Node` and links
it to `node`.

```jldoctest
julia> import EzXML: ElementNode, prettyprint; import Kelpie: link_or_text!

julia> prettyprint(link_or_text!(ElementNode("div"), ElementNode("br")))
<div>
  <br/>
</div>

julia> prettyprint(link_or_text!(ElementNode("h1"), "Kelpie.jl"))
<h1>Kelpie.jl</h1>

julia> prettyprint(link_or_text!(ElementNode("div"), "The end", ElementNode("hr")))
<div>The end<hr/></div>
```
"""
function link_or_text!(node, content...)
    for con in content
        if !isnothing(con)
            if typeof(con) <: EzXML.Node
                link!(node, con)
            else
                link!(node, EzXML.TextNode(string(con)))
            end #if
        end #if
    end #for

    return node
end #function

"""
    html_element(name, content...=nothing; kwargs...)

Creates a new `EzXML.Node` with name `name`, containing `content`, and with attributes
specified by `kwargs`.

# Example

```jldoctest
julia> import EzXML: prettyprint

julia> prettyprint(html_element("img"; src="https://millironx.com/images/charolette.jpg"))
<img src="https://millironx.com/images/charolette.jpg"/>

julia> prettyprint(html_element("span", "MillironX"; class="label-primary"))
<span class="label-primary">MillironX</span>
```
"""
function html_element(name::AbstractString, content...=nothing; kwargs...)
    el = EzXML.ElementNode(name)

    for (key, value) in kwargs
        link!(el, EzXML.AttributeNode(replace(string(key), "_" => "-"), string(value)))
    end #for

    if !isnothing(content)
        link_or_text!(el, content...)
    end #if

    return el
end #function

"""
    html(content...=nothing; kwargs...)

Creates a new HTML document filled with `content`.

# Example

```jldoctest
julia> import EzXML: prettyprint

julia> prettyprint(html())
<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<!DOCTYPE html SYSTEM "about:legacy-compat">
<html/>
```
"""
function html(content...=nothing; kwargs...)
    doc = EzXML.HTMLDocumentNode("about:legacy-compat", nothing)
    node = html_element("html", content...; kwargs...)
    link!(doc, node)
    return doc
end #function

for symbol in HTML_ELEMENTS
    name = string(symbol)

    @eval function $symbol(content...=nothing; kwargs...)
        return html_element($name, content...; kwargs...)
    end #function

    @eval export $symbol
end

function html_div(content...=nothing; kwargs...)
    return html_element("div", content...; kwargs...)
end #function

end #module

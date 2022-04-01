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
    link_or_text!(node, content)

Converts `content` to an `EzXML.TextNode` if it isn't already an `EzXML.Node` and links it
to `node`. Will link all nodes in `content` if content is a vector.

```jldoctest
julia> import EzXML: ElementNode, prettyprint; import Kelpie: link_or_text!

julia> prettyprint(link_or_text!(ElementNode("div"), ElementNode("br")))
<div>
  <br/>
</div>

julia> prettyprint(link_or_text!(ElementNode("h1"), "Kelpie.jl"))
<h1>Kelpie.jl</h1>

julia> prettyprint(link_or_text!(ElementNode("div"), ["The end", ElementNode("hr")]))
<div>The end<hr/></div>
```
"""
function link_or_text!(node, content)
    if typeof(content) <: EzXML.Node
        link!(node, content)
    else
        link!(node, EzXML.TextNode(string(content)))
    end #if

    return node
end #function

function link_or_text!(node, content::AbstractArray)
    for con in content
        link_or_text!(node, con)
    end #for

    return node
end #function

"""
    html_element(name, content=nothing; kwargs...)

Creates a new `EzXML.Node` with name `name`, containing `content`, and with attributes
specified by `kwargs`.

# Example

```
julia> import EzXML: prettyprint

julia> prettyprint(html_element("img"; src="https://millironx.com/images/charolette.jpg"))
<img src="https://millironx.com/images/charolette.jpg"/>

julia> prettyprint(html_element("span", "MillironX"; class="label-primary"))
<span class="label-primary">MillironX</span>
```
"""
function html_element(name::AbstractString, content=nothing; kwargs...)
    el = EzXML.ElementNode(name)

    for (key, value) in kwargs
        link!(el, EzXML.AttributeNode(replace(string(key), "_" => "-"), string(value)))
    end #for

    if !isnothing(content)
        link_or_text!(el, content)
    end #if

    return el
end #function

"""
    html(content)

Creates a new HTML document filled with `content`.
"""
function html(content)
    doc = EzXML.HTMLDocumentNode(nothing, nothing)
    link_or_text!(doc, content)
    return doc
end #function

for symbol in HTML_ELEMENTS
    name = string(symbol)

    @eval function $symbol(content=nothing; kwargs...)
        return html_element($name, content; kwargs...)
    end #function

    @eval export $symbol
end

function html_div(content=nothing; kwargs...)
    return html_element("div", content; kwargs...)
end #function

end #module

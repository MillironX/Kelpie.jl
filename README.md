# Kelpie

[![Stable](https://img.shields.io/badge/docs-stable-blue.svg)](https://MillironX.github.io/Kelpie.jl/stable)
[![Dev](https://img.shields.io/badge/docs-dev-blue.svg)](https://MillironX.github.io/Kelpie.jl/dev)
[![Build Status](https://github.com/MillironX/Kelpie.jl/actions/workflows/CI.yml/badge.svg?branch=master)](https://github.com/MillironX/Kelpie.jl/actions/workflows/CI.yml?query=branch%3Amaster)
[![Coverage](https://codecov.io/gh/MillironX/Kelpie.jl/branch/master/graph/badge.svg)](https://codecov.io/gh/MillironX/Kelpie.jl)
[![Code Style: Blue](https://img.shields.io/badge/code%20style-blue-4495d1.svg)](https://github.com/invenia/BlueStyle)
[![PkgEval](https://JuliaCI.github.io/NanosoldierReports/pkgeval_badges/K/Kelpie.svg)](https://JuliaCI.github.io/NanosoldierReports/pkgeval_badges/report.html)
[![Genie Downloads](https://shields.io/endpoint?url=https://pkgs.genieframework.com/api/v1/badge/Kelpie)](https://pkgs.genieframework.com?packages=Kelpie)

:dog2: I accidentally built an HTML templating engine in Julia. It looked a lot
like [Pug](https://pugjs.org), but I like working dogs better, so I named it
Kelpie.

## Installation

You can install straight from the [Julia REPL]. Press `]` to enter [pkg mode],
then:

```julia
add Kelpie
```

## Usage

Most HTML elements[^1] now have functions of the same name: simply pass the contents
as a positional argument, and attributes as keyword arguments, and everything
will be returned as an [EzXML](https://github.com/JuliaIO/EzXML.jl) Document or
Node.

```julia
import EzXML: prettyprint

doc = html([
  head([
    title("Kelpie.jl is awesome!"),
  ]),
  body([
    header([
      h1("Dogs are cool"),
      h2("Julia is cool"),
    ]),
    main([
      img(;
        src="/kelpie-on-sheep-back.jpg",
        alt="A Kelpie herding sheep"
      ),
      [
        p("Kelpies make great herding dogs for $animal.")
        for animal in ["cows", "sheep", "chickens"]
      ]...,
    ]),
  ]),
])

prettyprint(doc)
```

Turns into

```html
<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" "http://www.w3.org/TR/REC-html40/loose.dtd">
<head>
  <title>Kelpie.jl is awesome!</title>
</head>
<body>
  <header>
    <h1>Dogs are cool</h1>
    <h2>Julia is cool</h2>
  </header>
  <main>
    <img src="/kelpie-on-sheep-back.jpg" alt="A Kelpie herding sheep"/>
    <p>Kelpies make great herding dogs for cows.</p>
    <p>Kelpies make great herding dogs for sheep.</p>
    <p>Kelpies make great herding dogs for chickens.</p>
  </main>
</body>
```

Everything is pure Julia, so your imagination is the limit!

[^1]: Exception: `div` is the division function, and I wanted to leave it that
    way. To make `<div>`s, you need to use `html_div`.

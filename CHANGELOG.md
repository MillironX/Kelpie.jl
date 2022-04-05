# Changelog

All notable changes to Kelpie.jl will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Changed

- Arrays of content replaced with argument splatting ([#2](https://github.com/MillironX/Kelpie.jl/pull/2))

### Fixed

- `html()` now returns an `<html>` node, not just a document ([#3](https://github.com/MillironX/Kelpie.jl/pull/3))

## [0.1.0] - 2022-04-04

### Added

- New Julia package based on [PkgTemplates.jl](https://github.com/invenia/PkgTemplates.jl)
- Functions to create HTML nodes by name
- Automatically-generated functions to generate types of HTML nodes

[unreleased]: https://github.com/MillironX/Kelpie.jl/compare/v0.1.0...HEAD
[0.1.0]: https://github.com/MillironX/Kelpie.jl/releases/tag/v0.1.0

# Contributing to Kelpie.jl

Thanks for pitching in to Kelpie. Here's a basic outline of how we muster the
mob of ideas and code from everyone into a single package.

## Step 1. Check for a reported issue

If you have a problem with or suggestion for Kelpie, check to see if someone
else has the same or a similar idea on our [Issues page]. If that issue exists,
use a [GitHub reaction] to support it. If you can't find anything similar,

## Step 2. Open a new issue

Open a [new issue], and follow the template for your type of issue (there are
separate templates for suggestions and bugs).

## Step 3. Fork the repo

If you think you can solve an issue, then [fork] the MillironX/Kelpie.jl repo to
your own GitHub account. To keep things, clean, please [create a new branch] for
your work.

## Step 4. Code

There are many ways to code on a Julia package. This is my favorite, and there
are dot files in the repo to support it.

1. Install [Visual Studio Code]
2. Clone your fork of the repo
3. Open the package folder in VSCode
4. [Install the recommended extensions]
5. Checkout your branch
6. Press <kbd>Alt</kbd>+<kbd>J</kbd>, <kbd>Alt</kbd>+<kbd>O</kbd> to launch an
   integrated Julia REPL
7. Press <kbd>]</kbd>, and then type `activate .` <kbd>ENTER</kbd> `instantiate`
   <kbd>ENTER</kbd> <kbd>BACKSPACE</kbd>

Of note while you code:

- We use the [Blue style] for Julia files

## Step 5. Add or update tests

Make sure that your code passes all the current tests by using the REPL `] test`
command. If you change functionality, please add tests for that functionality to
the `test/runtests.jl` file.

## Step 6. Update the Changelog

Add a note to the `CHANGELOG.md` file under the "Unreleased" header indicating
what kind of change you made. See <https://keepachangelog.com> for the required
format.

## Step 7. Pull request

Submit a pull request against the `master` branch and wait for it to be merged.

[blue style]: https://github.com/invenia/BlueStyle
[create a new branch]: https://docs.github.com/en/pull-requests/collaborating-with-pull-requests/proposing-changes-to-your-work-with-pull-requests/creating-and-deleting-branches-within-your-repository#creating-a-branch
[fork]: https://github.com/MillironX/Kelpie.jl/fork
[github reaction]: https://github.blog/2016-03-10-add-reactions-to-pull-requests-issues-and-comments/
[install the recommended extensions]: https://code.visualstudio.com/docs/editor/extension-marketplace#_workspace-recommended-extensions
[issues page]: https://github.com/MillironX/Kelpie.jl/issues
[new issue]: https://github.com/MillironX/Kelpie.jl/issues/new/choose
[visual studio code]: https://code.visualstudio.com

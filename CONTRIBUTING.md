# Contributing to Trace Viewer Examples

Thanks for your interest in the [Trace Viewer Examples][trace-viewer-examples]! The following is a set of
guidelines for contributing to the Trace Viewer extension for Theia applications.

## How to Contribute

⚠️ **Important note** Setting up the development environment on Linux is the easiest. If you are trying
to run the project on Windows or MacOs and you are encountering issues, please [contact us][contact-us].

In order to contribute, please first [open an issue][issues] that clearly describes the bug you
intend to fix or the feature you would like to add. Make sure you provide a way to reproduce the bug
or test the proposed feature.

Once you have your code ready for review, please  [open a pull request][pull-requests]. Please follow
the [pull request guidelines][pr-guide]. If you are new to the project, the
[new contributors][new-contributors] section provides useful information to get you started. A
committer of the Trace Extension will then review your contribution and help to get it merged.

## Code of Conduct

This project is governed by the [Eclipse Community Code of Conduct](CODE_OF_CONDUCT.md).
By participating, you are expected to uphold this code.

## Eclipse Development Process

This Eclipse Foundation open project is governed by the [Eclipse Foundation
Development Process][dev-process] and operates under the terms of the [Eclipse IP Policy][ip-policy].

## Eclipse Contributor Agreement

In order to be able to contribute to Eclipse Foundation projects you must
electronically sign the [Eclipse Contributor Agreement (ECA)][eca].

The ECA provides the Eclipse Foundation with a permanent record that you agree
that each of your contributions will comply with the commitments documented in
the Developer Certificate of Origin (DCO). Having an ECA on file associated with
the email address matching the "Author" field of your contribution's Git commits
fulfills the DCO's requirement that you sign-off on your contributions.

For more information, please see the [Eclipse Committer Handbook][commiter-handbook].

## Pull request guidelines

**Changes to the project** are made by submitting code with a pull request (PR).

* [How to write and submit changes][creating-changes]
* [Example pull request][issue-402]

**Good commit messages** make it easier to review code and understand why the changes were made.
Please include a:

* *Title:* Concise and complete title written in imperative (e.g. "Update Gitpod demo screenshots"
or "Single-click to select or open trace")
* *Problem:* What is the situation that needs to be resolved? Why does the problem need fixing?
Link to related issues (e.g. "Fixes [#317][issue-317]").
* *Solution:* What changes were made to resolve the situation? Why are these changes the right fix?
* *Impact:* What impact do these changes have? (e.g. Numbers to show a performance improvement,
screenshots or a video for a UI change)
* [*Sign-off:*][sign-off] Use your full name and a long-term email address. This certifies that you
have written the code and that, from a licensing perspective, the code is appropriate for use in open-source.

Other commit information:

* [How to format the message][commit-message-message]
* [Example commit message][commit-message-example]

## New contributors

## Formatting code with Prettier

If a commit fails to pass CI checks because of its format, contributors can use Prettier, which is already conveniently set up in the project,
to quickly format their commit.

* To format a single file, simply run `yarn prettier --write <path-to-file>`.
* To run Prettier on all source code files, run `yarn format:write`. Prettier will only format files that are not formatted correctly.
* To check if new changes comply with Prettier rules, run `yarn prettier --check <path-to-file>` or `yarn format:check` to perform the check on a single file
  or all source code file, respectively.

## Ignoring linting/formatting commits

Should one be needing to use `git blame` to view the changes that were made recently to a file, it might be necessary to
ignore the changes that were made in linting/formatting commits. In the root of the repo, there is a `.git-blame-ignore-revs`
file. Adding the SHA-1 of a commit to this file will make `git-blame` ignore that commit. To use this file:

* For GitHub, this file is automatically detected and will ignore all the commits that are included in the file.
* With Git CLI, run `git blame --ignore-revs-file=.git-blame-ignore-revs <pathToSomeFile>` to ignore the commits.

## Contact

For issues related to the Trace Viewer, please open a GitHub tracker for the [Trace Viewer Examples][trace-viewer-examples].

For issues concerning `eclipse-cdt-cloud`, please refer to the contact options listed on the [CDT.Cloud website][cdt-cloud-website].

[architecture]: https://github.com/eclipse-cdt-cloud/theia-trace-extension#architecture
[cdt-cloud-website]: https://cdt-cloud.io/contact/
[commit-message-example]: https://github.com/eclipse-cdt-cloud/theia-trace-extension/commit/bc18fcd110d7b8433293692421f2e4fb49f89bd6
[commit-message-message]: https://tbaggery.com/2008/04/19/a-note-about-git-commit-messages.html
[commiter-handbook]: https://www.eclipse.org/projects/handbook/#resources-commit
[contact-us]: #contact
[creating-changes]: https://www.dataschool.io/how-to-contribute-on-github/
[dev-process]: https://eclipse.org/projects/dev_process
[eca]: http://www.eclipse.org/legal/ECA.php
[external-components]: https://github.com/eclipse-cdt-cloud/theia-trace-extension#related-code
[good-first-issues]: https://github.com/eclipse-cdt-cloud/trace-viewer-examples/issues?q=is%3Aopen+is%3Aissue+label%3A%22good+first+issue%22
[flexible-architecture-video]: https://www.youtube.com/watch?v=8s5vGf45e-g
[flexible-architecture-slides]: https://tracingsummit.org/ts/2019/files/Tracingsummit2019-theia-dagenais.pdf
[gitpod-demo]: https://github.com/eclipse-cdt-cloud/theia-trace-extension#Nightly-via-Gitpod
[ip-policy]: https://www.eclipse.org/org/documents/Eclipse_IP_Policy.pdf
[issues]: https://github.com/eclipse-cdt-cloud/trace-viewer-examples/issues
[new-contributors]: #new-contributors
[pr-guide]: #pull-request-guidelines
[pull-requests]: https://github.com/eclipse-cdt-cloud/theia-trace-extension/pulls
[sign-off]: https://git-scm.com/docs/git-commit#Documentation/git-commit.txt---signoff
[trace-viewer-examples]: https://github.com/eclipse-cdt-cloud/trace-viewer-examples
[tracevizlab]: https://github.com/dorsal-lab/Tracevizlab
[tracing-with-theia-video]: https://www.youtube.com/watch?v=Fysg1mOadik
[tracing-with-theia-slides]: https://www.eclipsecon.org/sites/default/files/slides/EclipseConEurope2019-TraceCompass-Theia.pdf
[tracing-summit]: https://tracingsummit.org/ts/2019/
[tracompa-cloud-video]: https://www.youtube.com/watch?v=DFxWXE4A-uQ
[tracompa-cloud-slides]: https://www.eclipsecon.org/sites/default/files/slides/EclipseCon2021-TraceCompassCloud.pdf

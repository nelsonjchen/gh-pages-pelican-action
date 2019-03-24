# GitHub Pages Pelican Build Action

This action builds a Pelican project and deploys it to GitHub pages.

It was extracted from https://github.com/desertpy/desertpy-pelican/ which
has modified it a bit there to handle some extra pre-processing commands.

That said, this is *not currently being used* on GitHub actions there either.
GitHub actions did not support scheduled jobs. We've lightly ported it to
CircleCI there.

If you don't have a need for custom commands or scheduled runs,
this GitHub action is perfect for your Pelican project!

# GitHub Pages Pelican Build Action

This action builds a Pelican project and deploys it to GitHub Pages.

Please ensure a `requirements.txt` is present for your site and installs
`pelican` and other requirements needed to build your site.

## Secrets

  - `GIT_DEPLOY_KEY`: provide the private key for a [deploy key][1]

## History

Extracted from https://github.com/desertpy/desertpy-pelican.

It is not used there anymore though. For most sites though, this should
suffice.

  [1]: https://developer.github.com/v3/guides/managing-deploy-keys/#deploy-keys

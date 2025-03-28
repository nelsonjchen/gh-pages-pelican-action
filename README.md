# No longer supported

Sorry, I no longer use or support this project. Please look for alternatives. 

# GitHub Pages Pelican Build Action

This action builds a Pelican project and deploys it to GitHub Pages.

Please ensure a `requirements.txt` is present for your site and installs
`pelican` and other requirements needed to build your site.

A `requirements.txt` can be generated by running `pip freeze > requirements.txt`
in the virtual environment your pelican site is developed in.

## Environment variables

  - `GH_PAGES_BRANCH` (optional): override the default `gh-pages` deployment branch
  - `GH_PAGES_CNAME` (optional): specify the custom domain you've configured (if any)
  - `PELICAN_CONFIG_FILE` (optional): override the default `pelicanconf.py` config file    
  - `PELICAN_CONTENT_FOLDER` (optional): override the default `content` content folder
  - `PELICAN_THEME_FOLDER` (optional): setup the theme folder with `package.json` file, it is required if you need install node modules.   
  - `GITHUB_TOKEN`: (required) should be `${{secrets.GITHUB_TOKEN}}`, see [the workflow demo in the demo repository for an example of this][workflow_demo]. This secret is fulfilled by GitHub.

## Demo

Repository: https://github.com/nelsonjchen/pelican-action-demo

Website: https://pelican-action-demo.mindflakes.com/

## History

Extracted from https://github.com/desertpy/desertpy-pelican.

It is not used there anymore though. For most sites though, this should
suffice.

[1]: https://developer.github.com/v3/guides/managing-deploy-keys/#deploy-keys
[workflow_demo]: https://github.com/nelsonjchen/pelican-action-demo/blob/98ad1a776e95d05b0658a179c4d28e20c353bba4/.github/workflows/pelican.yml#L19

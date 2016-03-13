# jekyll-html-proofer

A Jekyll plugin that uses [html-proofer](https://github.com/gjtorikian/html-proofer) to check the generated html code for errors.

## Setup

    gem install html-proofer
    cd YOUR_JEKYLL_DIR
    git submodule add https://github.com/episource/jekyll-html-proofer.git _plugins/jekyll-html-proofer

## Configure

Configure html-proofer by adding a **html_proofer** node to your _config.yml. The [html-proofer documentation](https://github.com/gjtorikian/html-proofer#configuration) lists all supported options.

    html_proofer:
      check_favicon: true
      check_html: true
      file_ignore:
        - /a.*regexp*/
        - a_string
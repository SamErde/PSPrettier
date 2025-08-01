# 🖼️ PSPrettier

Prettier wrapped in a PowerShell module so PS devs can use it from the command line.

## 💫 Motivation

Did you know that Prettier has a GitHub action *and* a CLI? Cool! But there's no PowerShell module! I'm building a wrapper around that, because I want to. :sweat_smile:

### 🤔 But actually, *why*?

Because PSScriptAnalyzer can analyze your formatting of PowerShell scripts, but your project probably has lots of other files that it cannot check and fix for you. PSPrettier to the rescue...(maybe?).

## 🗺️ Placeholder and Roadmap

This "module" is still an early stage concept without a proper structure and build process. Features to come will include:

- A helper function to install Prettier
- A helper function to install Node.js, if necessary
- Repack standalone binaries and ship them with the module to remove the dependency on Node.js
- And more...

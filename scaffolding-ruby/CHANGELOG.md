# Ruby Scaffolding CHANGELOG

[Full history](https://github.com/habitat-sh/core-plans/commits/master/scaffolding-ruby)

# 0.8.11 (05-29-2019)

- Replace dependency on `core/postgresql` with `core/postgresql-client`. [\#2595](https://github.com/habitat-sh/core-plans/issues/2595)

# 0.8.10 (09-20-2018)

- Fix parsing of `bundler --version` output to ensure ${_bundler_version}
  is really the version number of bundler

# 0.8.9 (12-08-2017)

- Improve git detection with `git rev-parse --is-in-work-tree`, makes
  core/git a direct build dependency

# 0.8.8 (11-27-2017)
- move the bundle config swap out to do_default_prepare

# 0.8.7 (10-20-2017)
- provide a default database config for asset compilation

## 0.8.0 (05-18-2017)

## Features & Enhancements

- Support external database connection via optional bind. [\#535](https://github.com/habitat-sh/core-plans/pull/535)
- Various documentation fixes and updates.

## 0.7.0 (05-11-2017)

## Features & Enhancements

- Add support for Rails 4.2. [\#509](https://github.com/habitat-sh/core-plans/pull/509)
- Allow Plan hash values & default.toml data to win. [\#512](https://github.com/habitat-sh/core-plans/pull/512)
- Attempt to only add default.toml data if not set in Plan. [\#512](https://github.com/habitat-sh/core-plans/pull/512)

## Bug fixes

- Ensure that symlinked dirs are created first in init hook. [\#510](https://github.com/habitat-sh/core-plans/pull/510)

## 0.6.0 (05-05-2017)

- Initial release.

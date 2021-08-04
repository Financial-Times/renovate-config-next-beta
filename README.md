# renovate-config-next-beta

[![CircleCI](https://circleci.com/gh/Financial-Times/renovate-config-next-beta.svg?style=svg)](https://circleci.com/gh/Financial-Times/renovate-config-next-beta)

> Shared [Renovate](https://renovatebot.com/) configuration for FT.com.

## Changes in the Beta Version
This beta version is a fork of the [renovate-config-next](https://github.com/Financial-Times/renovate-config-next) repo, but since that configuration can't be versioned, this repo contains some backwards-incompatible changes that we wanted to introduce.

Changes include:
- setting `dependencyDashboardApproval` to default to true for all repos preventing Renovate from opening PRs for most things without a manual step. this will significantly reduce the PR noise in repositories, instead moving update control to the 'dependency dashboard' issue Renovate creates.
- keeping the `rangeStrategy` as `replace`, but removing the override that would set it to `auto` for internal packages. 'auto' was forcibly pinning the versions of internal repositories, which is unnecessary -- if a patch update is important/relevant we will notify the appropriate teams (and likely have already been working with them on the fix) and don't need to alert other parties.
- removing the `:docker` preset. this only served to update the docker image version of node we are using in the CircleCI config, which didn't respect the node `supportPolicy` setting and kept trying to update to later versions of node prematurely.

Read more about [how we're using Renovate on its wiki page](https://github.com/Financial-Times/next/wiki/Renovate).

## Usage

Reference the shared configuration in your repository's own `renovate.json` like so:

```json
{
  "extends": [
    "github>financial-times/renovate-config-next-beta"
  ]
}
```

## Development

Our shared configuration is defined in [`renovate-config.json5`](renovate-config.json5). This file is transpiled on a pre-commit hook into the [`renovate.json`](renovate.json) file. Modifying the [`renovate.json`](renovate.json) won't allow you to commit, so make sure all of your modifications go on the `json5` version. If for some reason there are untracked changes on your `renovate.json` file, make sure to delete the file to be able to commit.

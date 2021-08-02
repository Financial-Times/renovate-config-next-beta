# renovate-config-next-beta

[![CircleCI](https://circleci.com/gh/Financial-Times/renovate-config-next-beta.svg?style=svg)](https://circleci.com/gh/Financial-Times/renovate-config-next-beta)

> Shared [Renovate](https://renovatebot.com/) configuration for FT.com.

## Changes in the Beta Version
This beta version is a fork of the [renovate-config-next](https://github.com/Financial-Times/renovate-config-next) repo, but since that configuration can't be versioned, this repo contains some backwards-incompatible changes that we wanted to introduce.

Changes include:
- setting `dependencyDashboardApproval` to default to true for all repos preventing Renovate from opening PRs for most things without a manual step. this will significantly reduce the PR noise in repositories, instead moving update control to the 'dependency dashboard' issue Renovate creates.
- keeping the `rangeStrategy` as `replace`, but removing the override that would set it to `auto` for internal packages. 'auto' was forcibly pinning the versions of internal repositories, which is unnecessary -- if a patch update is important/relevant we will notify the appropriate teams (and likely have already been working with them on the fix) and don't need to alert other parties.
- removing the `:docker` preset. this only served to update the docker image version of node we are using in the CircleCI config, which didn't respect the node `supportPolicy` setting and kept trying to update to later versions of node prematurely.
## Our Configuration

We have a custom set of rules for FT.com repositories. We are generally...

* Letting Renovate decide how to [modify or update existing ranges](https://renovatebot.com/docs/configuration-options/#rangestrategy) on Financial Times owned `dependencies`

  * For apps this means pinning to specific versions for reliability/predictability e.g. `@financial-times/n-express@19.19.1`, with pull requests being opened for any new version

  * For components this means using semver ranges e.g. `@financial-times/n-fetch@^1.0.0`, only opening pull requests for major version updates

* Using semver ranges for all other `dependencies` (including [`n-ui`](https://github.com/Financial-Times/n-ui)), only opening pull requests for major version updates

* Grouping updates for our monorepos (such as [x-dash](https://github.com/Financial-Times/x-dash) and [Page Kit](https://github.com/Financial-Times/dotcom-page-kit)) into a single pull request

* [Upgrading Node.js to LTS versions](https://renovatebot.com/docs/node/#configuring-support-policy), including any under their maintenance period.

* Tracking major updates of `devDependencies` and [Origami](https://registry.origami.ft.com/components) components (`o-*` packages) in the Renovate master issue, but **we're not** opening pull requests automatically for them

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

Our shared configuration is defined in [`renovate.json`](renovate.json).

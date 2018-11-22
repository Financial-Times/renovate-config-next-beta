# renovate-config-next

[![CircleCI](https://circleci.com/gh/Financial-Times/renovate-config-next.svg?style=svg)](https://circleci.com/gh/Financial-Times/renovate-config-next)

> Shared [Renovate](https://renovatebot.com/) configuration for FT.com.

## Our Configuration

We have a custom set of rules for FT.com repositories. We are generally...

* Letting Renovate decide how to [modify/update existing ranges](https://renovatebot.com/docs/configuration-options/#rangestrategy) for our own
`dependencies`:
  * For apps this means pinning to specific versions for reliability/predictability
  e.g. `@financial-times/n-express@19.19.1`, with pull requests being opened for
  any new version.
  * For components this means using semver ranges e.g. `@financial-times/n-fetch@^1.0.0`
  only opening pull requests for major updates.
* Using semver ranges for all other `dependencies` (including [`n-ui`](https://github.com/Financial-Times/n-ui)),
only opening pull requests for major updates.
* Tracking major updates of `devDependencies` and [Origami](https://registry.origami.ft.com/components)
components (`o-*`) in the Renovate master issue, but **we're not** opening pull
requests automatically for them.

Read more about [how we're using Renovate on it's wiki page](https://github.com/Financial-Times/next/wiki/Renovate).

## Usage

Reference the shared configuration in your project's `renovate.json` like so:

```json
{
  "extends": [
    "github>financial-times/renovate-config-next"
  ]
}
```

## Development

Our shared configuration is defined in [`renovate.json`](renovate.json).
Please open a PR for any changes you would like to propose and add
[@Financial-Times/etg](https://github.com/orgs/Financial-Times/teams/etg) as a
reviewer.

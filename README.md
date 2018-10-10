# n-renovate

[![CircleCI](https://circleci.com/gh/Financial-Times/n-renovate.svg?style=svg)](https://circleci.com/gh/Financial-Times/n-renovate)

> Shared configuration for [Renovate](https://renovatebot.com/).

## Usage

Install the package with npm.

```
npm install --save-dev github:finanial-times/n-renovate
```

Then define the shared configuration in your project's `renovate.json`.

```json
{
  "extends": [
    "config:financial-times-base"
  ]
}
```
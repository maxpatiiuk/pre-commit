# Pre-commit Hooks

A collection of pre-commit hooks for [pre-commit.com](https://pre-commit.com/).

## TypeScript Type Checker

Runs TypeScript Type Checker to check your `.js`/`.ts`/`.jsx`/`.tsx` files.

You need to have `npm` and `npx` installed, along with a `typescript` npm
package.

You can provide an optional parameter that would specify the location of your
`tsconfig.json` file. You can specify a relative path starting with `./` or an
absolute path. If this parameter is omitted, it would try to automatically find
a `tsconfig.json` file in the repository's root directory or any subdirectory.

Usage:

```yml
- repo: https://github.com/maxpatiiuk/pre-commit/
  rev: v1.0.0
  hooks:
    - id: tsc
      args: [./] # optional
```

NOTE: if you didn't provide the path to your `tsconfig.json`, and the tool was
unable to find it automatically, it would fail silently. This is useful if you
want to use the same `.pre-commit-config.yaml` file for several different
projects. If you want to be notified of this error, add a `verbose: true` to the
above yaml structure just before `args`.

## Regex Blacklister

Makes sure that your files don't have strings matching a particular regex
pattern. Can be used to prevent private-key and password leakeage.

Blacklisted patterns should be located in a file, one per line and passed as an
argument.

Usage:

```yml
- repo: https://github.com/maxpatiiuk/pre-commit/
  rev: v1.0.0
  hooks:
    - id: regex-blacklister
      args:
        [dictionary.txt] # Relative or absolute location of a
        # dictionary with blacklisted regex
        # patterns
```

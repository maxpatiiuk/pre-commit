# Pre-commit Hooks

Useful [pre-commit](https://pre-commit.com/) hooks.

## TypeScript Type Checker

Runs TypeScript Type Checker to check your `.js`/`.ts`/`.jsx`/`.tsx`
files.

You need to have `npm` and `npx` installed, along with a `typescript`
npm package.

You can provide an optional parameter that would specify the location of
your `tsconfig.json` file. You can specify a relative path starting
with `./` or an absolute path. If this parameter is ommited, it would
try to automatically find a `tsconfig.json` file in the repository's
root directory or any subdirectory.

Usage:
```yml
 - repo: https://github.com/maxxxxxdlp/pre-commit/
   rev: v1.0.0
   hooks:
    - id: tsc
      args: [ ./ ]  # optional
```

## Regex Blacklister

Makes sure that your files don't have strings matching a particular
regex pattern. Can be used to prevent private-key and password
leakeage.

Blacklisted patterns should be located in a file, one per line and
passed as an argument.

Usage:
```yml
 - repo: https://github.com/maxxxxxdlp/pre-commit/
   rev: v1.0.0
   hooks:
    - id: regex-blacklister
      args: [dictionary.txt]  # Relative or absolute location of a
                              # dictionary with blacklisted regex
                              # patterns
```


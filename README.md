# Pre-commit Hooks

Useful [pre-commit](https://pre-commit.com/) hooks

## TypeScript Type Checker

Runs TypeScript Type Checker to check your `.js`/`.ts`/`.jsx`/`.tsx`
files.

Usage:
```yml
 - repo: https://github.com/maxxxxxdlp/pre-commit/
   rev: v1.0.0
   hooks:
    - id: tsc
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


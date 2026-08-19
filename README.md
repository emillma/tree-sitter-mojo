# tree-sitter-mojo

A [tree-sitter](https://tree-sitter.github.io/tree-sitter/) grammar for the
[Mojo programming language](https://docs.modular.com/mojo/manual/).

## Development

```sh
npm ci
npm run lint
npx tree-sitter generate
npm test
npx tree-sitter test
```

The acceptance check parses the bundled current-Mojo examples and rejects any
`ERROR` or `MISSING` nodes:

```sh
script/check-errors.sh
```

This fork follows [lsh/tree-sitter-mojo](https://github.com/lsh/tree-sitter-mojo)
and incorporates current-Mojo work from its earlier fork history. The grammar
originated from
[tree-sitter-python](https://github.com/tree-sitter/tree-sitter-python).

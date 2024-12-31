## Pick<T,K>
- Any K passed should be a child property of T.
```
type MyPick<T, K extends keyof T> = {
[Key in K]:T[Key]
};
```

## Patterns

- Given a subtype K of a type T, K

## `Async` in Rust


- `async` functions allow you to perform operations which can pause and resume without blocking the main thread. This is achieved through futures, which represent values which may not be available.
- `async` functions return a `Future` which means that the value will be computed later.
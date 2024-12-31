
## Why use `GET` requests instead of `POST`

- `GET` requests are idempotent ie. 






### serde

- Framework for `Serialisation` and `Deserialisation` of data. This helps in conversion to different formats like JSON,TOML or Binary.
- Data stored in this way to make its transmission more efficient.



## Traits

- A bunch of methods which must be implemented for a certain type.


## Creating a custom struct for otp type ie 6 digit types




##### `?` operator

- Used for error propagation upwards in the call stack.
- Also called the try operator.



## `Context`

- **Aggregate All Request Context:** `Context` is used to aggregate all the data needed to process the request, not only the request data.
- **Enable Middleware-like Behaviour:** By providing methods like `body_json`, `Context` can perform pre-processing, caching, or validation of the request body or other components before handing it off to the handler.
- **Simplify Handler Interfaces:** Instead of passing multiple separate arguments to handlers, `Context` provides a single, cohesive object. This simplifies the handler's signature and makes it easier to extend functionality.


#### `AppState`

- It is the shared application-wide state. It stores resources and data which are needed across multiple parts of the application.
- Examples are
1. **Connections or Clients**:
    - Redis client: Used for caching, sessions, or other key-value operations.
    - Database connection pool: Allows efficient interaction with your database.
2. **Configuration**:
    - Any global configuration values, such as timeouts, credentials, or service URLs.
3. **Other Shared Resources**:
    - Metrics, logging instances, or feature toggles.

#### Advantages

- **Centralized Resource Management**: It ensures that shared resources like Redis and the database pool are initialized once and reused across the app.
- **Scalability**: Wrapping resources in `Arc` and using async-safe libraries like `sqlx` and `redis` ensures the app can scale to handle many concurrent requests.







## `Error` definitions

```
type Error = Box<dyn std::error::Error + Send + Sync + 'static>;
```


#### `Box` Pointer

- Smart pointer which allocates memory on the `heap`.
- Why `Box`? It is because errors are of different types(IO errors,parse errors) and `Box` as it passes a generic, it treats them all the same.

# Traits
#### `dyn std::error::Error`


- Base of all error types.
- The basic trait which implements a basic trait for handling errors.
- The `dyn` keyword is used to indicate that it can be any type which implements the `std::error::Error` trait.


#### `Send`
- Allows types to be transferred between threads.
- We ensure that the error type can be safely moved between threads. This is essential for multithreaded or async applications, where errors might need to cross thread boundaries.


#### `Sync`
- It ensures that references to a type can be shared across threads safely.
- By adding `Sync`, we ensure that references to the error type can be safely accessed by multiple threads simultaneously.
- This is useful for concurrent scenarios where multiple threads might need to inspect the error.

#### `'static`
- Lifetime specifier which specifies that variable will be alive for whole duration of the program.






# Learnings

- Traits can be added.
- For brute force ie. when not sure abt lifetime of a variable, mark it `'static` which means it will be alive for whole duration of program.
- For optional fields, you need to specify them as `None` if not defined in `structs`.
```
pub struct Context{
body_bytes:Option<String>
}

//if undefined while initializing
let ctx = Context{
body_bytes:None
}
```




## Links

1. https://graphite.dev/guides/git-remove-committed-files
2. https://hub.docker.com/r/hadolint/hadolint
3. https://github.com/zupzup/rust-minimal-web-service-hyper/blob/main/src/router.rs
4. https://blog.logrocket.com/a-minimal-web-service-in-rust-using-hyper/



1. https://web.mit.edu/rust-lang_v1.25/arch/amd64_ubuntu1404/share/doc/rust/html/book/second-edition/ch20-05-sending-requests-via-channels.html
2. https://kerkour.com/rust-worker-pool
3. https://docs.rs/futures/latest/futures/stream/trait.Stream.html
4. https://doc.rust-lang.org/cargo/commands/cargo-doc.html
5. https://crates.io/crates/queues
6. https://learning-rust.github.io/docs/custom-error-types/
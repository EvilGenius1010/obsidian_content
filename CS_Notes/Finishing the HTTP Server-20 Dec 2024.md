
Today, gonna finish the otp service in Rust I was building. It was to finish a project which was done during a hackathon. 

I chose Rust cuz why not? I am using `hyper` to build the same. Lets do a deepdive into the same.

## Async Traits

- `Rust` does not allow async functions in traits



## Custom Traits 

- Lets start with what traits are. They are basically a collection of **methods** types can implement. This causes shared behaviour between types. They can be implemented for any type to give it defined behaviour.



## How are request bodies processed in `Hyper`

- The request body is given a type of `Request<Body>` which I don't expect anyone to know off the top of their head(duh!). Let's understand what this does. It has to do with the how HTTP requests are received.
- `HTTP` requests are received via `streaming` ie data is sent incrementally in small chunks. If you've done a bit of `Javascript`, you might remember the `+=chunk` pattern followed when implementing basic `HTTP` servers. |Provide code snippet for the same JS|
- So, this request body is basically a stream of data chunks which is usually received incrementally.
- Once, we receive the request fully, we can de-serialize it into a readable format.

```
```


## Sending messages to AWS SNS

- 
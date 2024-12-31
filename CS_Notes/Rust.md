- `cargo check --all` basically compiles the code, checks for errors but does not generate any code. Hence its faster than `cargo build`.



[[HTTP Server from scratch using Hyper]]



## `Self` Keyword

- Used to reference current `struct` or `enum` being used.




## `dyn` keyword

- It is used to deal with types which are not known at compile time.
- Usually, we pass a trait with it, indicating that the type passed can be any type which implements that particular trait.








## Importing functions from different file in same project

- Declare the other file as a module in the `main.rs` file.
- Then make the functions in the other file public using the `pub` keyword which allows it to be exported.
- Use the `use::filename::fnname` syntax to import the function.


```
//handler.rs

pub struct Context{
//export things here
}

pub fn sendOTP(){
//export fns
}

//main.rs

mod handler;
use handler::sendOTP;
```



## Naming Conventions

- `RFC 430` is the naming convention standard for Rust.


| Item                    | Convention                                            |
| ----------------------- | ----------------------------------------------------- |
| Types                   | UpperCamelCase                                        |
| Traits                  | UpperCamelCase                                        |
| Enum Variants           | UpperCamelCase                                        |
| Functions               | snake_case                                            |
| Methods                 | snake_case                                            |
| Structs                 | UpperCamelCase                                        |
| Constants and Statics   | SCREAMING_SNAKE_CASE                                  |
| Lifetimes               | short lowercase like `'a`                             |
| Generic Type Parameters | UpperCamelCase like single uppercase letter like `T`. |



[[Concurrency in Rust]]


# Custom Errors 

- It is a good practice to implement these so as to give information about the error.




# Traits

- They define the functionality a type must provide.


## Common Traits

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


#### `Debug`

- How should the error be displayed while debugging ie. programmer facing output.

#### `Display`

-   How should the end user see this error as a message/ user-facing output.






# Learnings


- `_ =>{}` is used as default matching pattern in `match` if nothing matches ie like the `else` case.




- Model where language calls the `OS` once to create a thread is called `1:1` ie. 1 `OS` thread per 1 language thread.
- Threads provided by programming languages are called as `green threads`. These green threads will be executed in the context of a different number of operating system threads and is thus called `M:N` model ie `M` green threads per `N` OS threads where `M` and `N` may not be the same number.
- _Runtime_ means code that is included by the language in every binary. Every `non-assembly` language has some runtime code. 
	- Having a large runtime code means having more control 
- Rust `std` library only provides `1:1` threading.





# Message Passing

- One of the ways of safe concurrency is message passing where threads communicate by passing data.


## Channels

- Has two halves, `transmitter`, and `receiver`.
```
use std::sync::mpsc;

fn main(){
let (tx, rx) = mpsc::channel();
}
//tx is the transmitter and rx is receiver.
```

- `rx` has two methods ,`recv` and `try_recv`. 
	- `recv` is blocking ie. it blocks the execution of the main thread and waits for receiving of a message. Once a message is received, `recv` will send a `Result<T,E>`.
	- `try_recv` is non-blocking and will send the `Result<T,E>` immediately. Its useful for the scenario that we can do other work while waiting for messages.

## Ownership Transferrence

- `tx.send()` takes ownership of anything which is passed to it.





## `Arc`

- Using `Clone()` on this gives address of this pointer to another instance.
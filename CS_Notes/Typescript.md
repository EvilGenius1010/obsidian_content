[[Type Challenges]]
[[O'Reilly Book on TS]]


## To Do's
- [ ] libuv thread pools.
- [ ] Promise chaining
- [ ] https://www.telerik.com/blogs/how-javascript-code-gets-executed-synchronous-asynchronous#:~:text=JavaScript%20is%20synchronous%2C%20blocking%20and,exact%20order%20of%20the%20statements.

# Shitty Features of JS/TS

- concat,map,forEach

# Features

#### Minification
- This is the process of removing unnecessary characters from code without altering its functionality.
- This involves removing comments,whitespaces and other things from the code.
- It is done to decrease sizes of files and increase performance.
- Webpack and Rollup can be used to do the same.

#### Tree Shaking
- Its a functionality used to eliminate unused modules from the bundle created.
- Suppose you have installed `bcrypt` but have not used it anywhere in your code, then it is eliminated from the final bundle. 
- Its done in the following way:
	- - **Dependency Analysis:** The bundler creates a dependency graph, mapping out how different modules are related to each other.
	- **Dead Code Identification:** The bundler analyzes the graph to identify modules that are not referenced by the entry point of your application or any other module.



## Asynchronous Functions

- Normally, code in TS is synchronous ie. it executes sequentially. If one line of code hasn't been completed, it waits until that line is completed and then proceeds to next one.
- But, instead of waiting for such tasks on the main thread, we can spawn a child 



### Why JS/TS not a multithreaded language

- Multithreading means, code runs on a single main execution thread.
- Synchronous code means code is executed line after line.
- In JS, code is **read line by line.** The thread waits for sync code to be executed.
- A line of code is read, then **added to call stack and executed.** This is the case for **sync code only.**
- If async code is detected, say using the await keyword, then it is added to a place called as the **event loop** inside the main thread. 
- This is then run in the background(by **libuv thread pools in nodejs** or **webworkers in the browser**.)
- Whenever the call stack gets empty, the main thread checks for any outputs in the event loop for any async code.
- If yes, it adds to current stack and returns it. 
- If not, continues current execution of sync code.
```
async function abc() {
  let ty1 = await fs.read("text1.txt");
  return ty1;
}

async function main() {
  let a1 = 1320182;
  let a2 = 23891;

  let a3 = await abc(); // Async call (task is delegated)
  let a4 = a1 + a2;      // Sync operation
  
  let aa5 = 480120123;
  let a6 = 2482308420348;
  let a7 = aa5 + a6;

  // More sync code here

  return a4;
}
```
- Here, a1 is added to call stack, executed and then removed. Same is done till we reach a3. 
- `a3` is pushed to event loop, and `a4` is added to call stack and executed. After `a4` is executed, its is removed from call stack which thus becomes empty. 
- So **every time call stack is empty, the main thread checks for any output from the event loop and if not, continues main thread of execution.**

>[!NOTE] Checking of Event Loop
>**Every time call stack is empty, the main thread checks for any output from the event loop and if not, continues main thread of execution.**


>[!NOTE] Keywords
> 1. Call Stack-> Stack in which sync code is added, executed and removed, if successful line by line.
> 2. Event Loop->Place where async code is pushed, to be run in background using thread pools or webworkers.

>[!NOTE] If code is async, it runs in background.


>[!NOTE] JS is not multithreaded cuz user cannot define threads and all main code runs via call stack which runs on main thread.

## Async Await

- It is a wrapper built on `Promises`.
- `await` when used inside an async function, blocks execution of that async function until result is returned.


# Promises
- They are a pretty way/method of making our code more readable.
```
let myPromise = new Promise(function(myResolve, myReject) {    
  
  myResolve(); // when successful  
  myReject();  // when error  
});  
  
myPromise.then(  
  (value)=> { /* code if successful */ },  
  (error)=> { /* code if some error */ }  
);
```

### Observations
- `myResolve()` returns what is passed to it.
- Always check return type


## Promise Chaining

- Way of call many asynchronous code in one go.
- Basically, `resolve` of first promise is returned to next `.then` called on it and whatever is returned to it is passed to next `.then`.
```
new Promise(function (resolve, reject) {
  setTimeout(() => resolve(1), 1000); // (*)
})
  .then(function (result) {
    // (**)

    console.log(result); // 1
    return result * 2;
  })
  .then(function (result) {
    // (***)

    console.log(result); // 2
    return result * 2;
  })
  .then(function (result) {
    console.log(result); // 4
    return result * 2;
  });

```

- It can be done thru different variables as well.
```
let promise = new Promise(function (resolve, reject) {
  setTimeout(() => resolve(1), 1000);
});

let promise2 = promise.then(function (result: any) {
  console.log(result); // 1
  return result * 2;
});

let promise3 = promise2.then(function (result) {
  console.log(result); // 1
  return result * 2;
});

let promsise4 = promise3.then(function (result) {
  console.log(result); // 1
  return result * 2;
});
```
The idea is that the result is passed through the chain of `.then` handlers.

Here the flow is:

1. The initial promise resolves in 1 second `(*)`,
2. Then the `.then` handler is called `(**)`, which in turn creates a new promise (resolved with `2` value).
3. The next `then` `(***)` gets the result of the previous one, processes it (doubles) and passes it to the next handler.
4. …and so on.

As the result is passed along the chain of handlers, we can see a sequence of `alert` calls: `1` → `2` → `4`.


[[Functional Programming using TS]]
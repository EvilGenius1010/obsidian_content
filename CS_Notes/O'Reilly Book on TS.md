What is type safety? -> Using types to prevent programs from doing undesirable things.

###### Steps to running JS Code followed

1. Program is parsed into an AST.
2. AST is compiled into bytecode.
3. Bytecode is evaluated by the runtime.

>Bytecode is a set of instructions which a virtual machine can interpret. It is an intermediary between source code and machine code.


- More importantly, `Typescript` code is converted to an `AST` which is then typechecked by the runtime.
- It is then converted to `JS` code.
- So, steps are
1. `Typescript` source code is converted to an `Abstract Syntax Tree`. 
2. The `AST` is type-checked by the type-checker.
3. Then the `AST` is converted to `Javascript` code.
4. `Javascript Program` is parsed into an `AST`.
5. AST is compiled into bytecode.
6. Bytecode is evaluated by the runtime.



- Steps 1–3 are done by TSC, and steps 4–6 are done by the JavaScript runtime.
- The type information is discarded during the compilation process. The generated JavaScript code doesn't contain any type annotations or checks. 

>In general, it is good style to let TypeScript infer as many types as it can for you, keeping explicitly typed code to a minimum.


#### Differences between JS and TS type systems

- `Javascript` needs to run the program to understand the types of a program ie. types are known at <u>run time</u>.
- But `Typescript` is a <u> gradually typed</u> language ie. it works best when it knows the types of everything at compile time,




## Detailed Dives into Types

### any

- Using `any` makes your code behave like regular `Javascript` and should be avoided at all costs. Why?
```
let a: any = 666  // any
let b: any = ['danger'] // any
let c = a + b      // any


// any
// any
```


### unknown

- For the few cases where you have a value whose type you really don’t know ahead of time, don’t use any, and instead reach for unknown
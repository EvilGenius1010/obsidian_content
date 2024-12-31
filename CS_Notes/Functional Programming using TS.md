## First Class Functions

Functions which are first-class have some characteristics 
1. Functions can be assigned to variables.
2. Functions can be passed as arguments to other functions.
3. They can be returned from other functions.


```
const hi = name => `Hi ${name}`;
const greeting = name => hi(name);
```

- Functions in `TypeScript` are first class functions ie. they can be treated as normal values.
- This process of creating a function to return a function is a bad practice as it just increases the amount of code and makes it more unmaintainable. How?
```
httpGet('/post/2', json => renderPost(json));
// If `httpGet` were to change to send a possible `err`, we would need to go back and change the "glue".

// go back to every httpGet call in the application and explicitly pass err along.
httpGet('/post/2', (json, err) => renderPost(json, err));
```
// go back to every httpGet call in the application and explicitly pass err along.
httpGet('/post/2', (json, err) => renderPost(json, err));
```
```


```
const greeting = hi;
greeting("times"); // "Hi times"
```

#### Leaky Abstractions
- `this` keyword refers to current execution context of a function. It holds a reference to the object that the function is a method of or can refer to a global object.
```
const Db = {
  data: [],
  save(data) {
    this.data.push(data);
  }
};

fs.readFile('freaky_friday.txt', Db.save); // Leaky Abstraction
```
-  `fs.readFile` expects a callback function as its second argument.
- When the file is read successfully, it calls `Db.save`.
- However, the execution context of `Db.save` is now inside the callback function of `fs.readFile`.
- Inside `Db.save`, `this` might refer to the global object instead of the `Db` object. This is because the callback function was not explicitly called as a method of `Db`.
- If `this.data` is intended to be the `data` property of the `Db` object, the `push` operation will fail because `this` doesn't reference `Db`.

```
const saveBound = Db.save.bind(Db); // Bind `this` to `Db` object

fs.readFile('freaky_friday.txt', saveBound);
```
- The `bind` keyword ensures that the `this` object always refers to the `Db` object as its execution context and not the `global` object.

#### Global Object
- It is a special object representing the global scope and is the top level object in the execution context.
- When a variable or function is declared outside of any function or object, it becomes a property of the global object. 
- In web browsers, the global object is typically the `window` object. In Node.js, it's the `global` object.

#### `bind` keyword

- It is used to create a new function with a specific `this` value, regardless of however the function is called later.
- It's particularly useful when dealing with methods of objects and ensuring they have the correct context.
```
const person = {
  firstName: "Alice",
  lastName: "Johnson",
  fullName: function() {
    return this.firstName + " " + this.lastName;
  }
};

const greet = person.fullName; // Reference to the function

console.log(greet()); // Output: undefined
```
- In this example, calling `fullName` will not work as `this` within `fullName` refers to the global object.
- Hence, `bind` is used to define the context of `this` to the `person` object.
```
const greet = person.fullName.bind(person);
console.log(greet()); // Output: Alice Johnson
```
- By using `bind(person)`, we're creating a new function where the `this` keyword will always refer to the `person` object, regardless of how the function is called.

>[!NOTE] `bind` takes parameters, first one indicates what context to be taken and from second onwards, it is the parameters of the function.


```
function multiply(x, y) {
  return x * y;
}

const multiplyByTwo = multiply.bind(null, 2);

console.log(multiplyByTwo(5)); // Output: 10
```

- `null` first parameter means that the context for the `this` object will be the `global` object. `2` is thus, the first parameter to be passed to the function.
- Effectively, this means that we need to pass only one argument to the function.


## Pure Functions 

>[!NOTE] A pure function is a function that, given the same input, will always return the same output and does not have any observable side effect.

```
// impure
let minimum = 21;
const checkAge = age => age >= minimum;

// pure
const checkAge = (age) => {
  const minimum = 21;
  return age >= minimum;
};
```

- In the impure section, `checkAge` depends on minimum age variable which is `mutable`.
- Its important that in pure functions, dependence should be only on constants.

### Side Effects

- A _side effect_ is a change of system state or _observable interaction_ with the outside world that occurs during the calculation of a result.



- [ ] When to use the `bind` keyword?
      Prompt -> how to know if some function uses the this context of object and whether i need to bind them?or is it a good practice to bind always when using methods of objects?explain in context of TS.
  
# Mistakes

## Promises

### 1-promisify-setTimeout
- return type of `resolve()` depends on what is passed to it.
```
function wait(n) {

  let newPromise = new Promise((resolve, reject) => {
    setTimeout(resolve(), n * 1000)

  })

  return newPromise
}
```
- Above, `resolve()` returns `undefined` but `setTimeout` expects a function.


### fileServer

- `req.params` needs to have a property cuz we pass into a URL, params as `render.com?name=hk` so it should be `req.params.name`.
- Remember which library you import and import it correctly.



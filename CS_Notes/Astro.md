[[Blogs]]

1. https://microblog-theta.vercel.app/tags/Tailwind


## Server First

- Uses server side rendering as much as possible.
- It allows to opt in for CSR only if needed.
- `.astro` files return a superset of `HTML`. 
- Borrows features like
	- `JSX` from React
	- `CSS` Scoping from Svelte
- As designed to be rendered in browser, don't need to worry about `hooks`, `refs`, `atoms` etc.
- 
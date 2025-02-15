# 6 Jan 2025 - Understanding `Astro`


- I have been wanting to add some features and customize this website.
- It will be as follows: 
	- A `DevLogs` section which will be high level updates on side projects.
	- A `Figuring it out` which is a deep-dive into specific bugs encountered during the building of projects described in `DevLogs`. 

Code is at https://github.com/EvilGenius1010/astro_blog and is the `blog` branch.
### Feature 1 

- For that, I need to understand how `astro` works. I'll be using `Gemini`,`ChatGPT` and the `Astro` Docs to understand.

### Routing

- It uses file-based routing like `Next.js`. It basically means that all `.astro` files inside these folders represent the code which is run when we go to that route. 
```
src/pages/index.astro        -> mysite.com/
src/pages/about.astro        -> mysite.com/about
src/pages/posts/1.md         -> mysite.com/posts/1
```


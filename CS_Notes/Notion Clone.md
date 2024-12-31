## Logic for building pages

1. Have a bunch of pages in root directory.
2. Parse the pages and render in the component.


## Prisma Docs



## How OPFS and FSAA works

#### FSAA
- File System Access API needs user permissions for reading, writing to files created.
- User-visible ie. can be accessed by user using their OS's file explorer.
- Many security checks to prevent malicious content.
- Slower.

#### OPFS
- Stores files privately within browser's sandbox.
- No user permissions needed for accessing files.
- Faster
- Not visible to user using their OS file explorer.
- Only origin which created the files can access them.
	- Origin like https://example.com


# Web Workers

- Allow scripts to be run in the background thread apart from the main execution thread.
- Laborious tasks can be run separately without slowing down the main thread.

### Tasks of WebWorkers
- Finding block hashes
- Differentiating on basis of hashes.
- Encryption


## Coding Them
Structure of `event.data`
- It is an object with two fields
	1. instruction - will be an enum.
	2. `Object` - Shape of this depends on what the instruction is.

### Types of Workers

#### Dedicated Workers

- d

#### Shared Workers

- Workers which can be accessed from several contexts like different tabs **but same origin**.
- 

## Integrating login and signin into same page

- Too many calls to db. As both username and email unique, have to check for duplicate insertion into database.
- So atleast 2(username and email), 2 more(creating new page+new user |maybe combine| and returning the data). If not new, 1 call to return existing pages.
- In separate pages, need 1 to 

- [ ] Do not allow users to delete all their pages in frontend cuz , else will create new user 


# Ideas

## Storing nested pages
- For storing nested pages, can create custom HTML tags. Or what can be done is that whenever a new page is created on frontend, then we can add it as a custom component which can contain necessary metadata about page.
- Download pages one level ie those immediately in the page in the background.



- **Saving just the changes instead of the whole files**


## Encrypting and Compressing data 

- Storing everything as blocks doesn't make sense as Notion is doing.
- But it does when the question of efficient compression and encryption comes in.
- We consider each paragraph or heading etc. as blocks.
	- Then we find the changes made to the blocks using `difflib` .
	- We compress the changes made for each block separately and then encrypt them.
	- Then we push them to DB using the update query in Postgres.
- Create a metadata which mentions which block is in what sequence in the page.
- **Delta Encoding:**
- **Identify Changes:** Use a diffing algorithm (like the one used in Git) to identify the specific changes between two versions of the data.
- **Compress and Encrypt only changed blocks**
- **Apply Deltas:** When reconstructing the data, apply the deltas sequentially to the original version.

### Encryption Algorithms
- Use `Crypto.JS's`  `CHACHA` implementation to encrypt.


### Storing Metadata
- Create a block called `<blockmetadata>` when new block created.

### Encryption Libraries for Serverside
- `node-forge`, `crypto-js`, `openpgp`
- https://chatgpt.com/share/6729d566-7290-8000-bd5c-98e7c274a292

### Flow for Encryption

-   store datas as blocks based on the para tag 
- check which is more efficient ie running diffmatchpatch on smaller blocks or just on one big block.
- check differences in all blocks
- compress and encrypt blocks which have changed.
- Send only blocks which have changed.

- [ ] For only updating blocks which have changed, need to change schema of db.


## SQLite DB

- [ ] Read and understand why it wasn't working before.
- [ ] Check next.config.mjs and understand its changes.
- [ ] Write parameterised statements for queries.
- [ ] Understand risks in running sqlite in browser.
- [ ] Use validator libraries like `validator.js`
- [ ] unserstand flow of how the sqlite lib works.

- Write code to only allow certain hooks to query the db.
- https://blog.logrocket.com/detailed-look-basic-sqljs-features/
- https://sql.js.org/#/

#### Mitigating security issues for running DB on clientside

- 












- [ ] Read about `CHACHA` algorithm.
- [ ] Read about compression algorithms as well.
- [x] Integrate Zustand
	- [ ] https://chatgpt.com/share/6729b17d-256c-8000-a413-9457052af340
	- [ ] https://zustand.docs.pmnd.rs/guides/nextjs#app-router
	- [ ] https://zustand.docs.pmnd.rs/guides/typescript
- [x] Setup zustand properly and create state.
- [ ] How to pass functions to props ie to pass to onupdate function ie. when passing as props to the function, at one place, no param
- [ ] If feasible, encrypt on serverside as well.
- [ ] Ways to store users secretkey securely on clientside.
- [ ] Invalid zustand hook call while processing user changes.
- [ ] In the treewalker method, first entry of output array is always an empty string. Fix it.
- [ ] Check the differences in serverside rendering and whether all code ive written in serverside or clientside.
- [ ] Check hydration errors meaning.
- [ ] Validate order of blocks and ensure its >=1.
- [ ] Do serverside validation of block number.
- [ ] Round Robin passing of data in sharedworkers ie solving When using shared workers, if I have 2 open tabs and code is basically running a setInterval which increases count every sec, then if 2 tabs are open of same path, then in each value updation only happens once every increase of 2. So one of them runs as 1,3,5,7 and if there are 3 tabs, then it runs as 1,4,7,10 etc.
- [ ] Deadlocks to prevent multiple concurrent writes to sqlite as OPFS has concurrency issues.
- [ ] Explain code of sharedWorker
- [ ] Separate keys for same content in blocks
- [ ] ways to store nested pages 
- [ ] Write queries for sqlite
- [ ] Persisting sqlite data using OPFS.
- [ ] Writing down all learnings.
- [ ] Reading about SQL queries.
- [ ] Finish reading semaphores and practical ways to prevent corrupt writes and deadlocks.
- [ ] Try understanding more about the zustand code.
- [ ] Read and understand all your code once main features done.
- [ ] Deploy to Vercel once done 
- [ ] Add **react-hotkeys**
- [ ] Enforce types for shared worker code.





### Dumb Things 

- State is `[]` of changes so never null.


## Bugs

1. `HYDRATION ERRORS` - **Hydration** is a process in React where the client-side JavaScript takes control of a pre-rendered HTML document, adding interactivity and dynamic behavior. Think of it as "breathing life" into a static HTML page. `Hydration Mismatch` basically means server rendered HTML does not match with the clientside rendering.
	- To prevent in Tiptap, set `immediatelyRender: false`. This basically tells Tiptap to prevent rendering until client side JS has loaded fully.

2. `INVALID HOOK CALL`







# Possible Features
- Single Use link for collaboration.
- Use https://ui.aceternity.com/components/following-pointer for pointers while collaborating.
- Allow ppl to collab without signing in. Without signin, simply save the data to the browser sqlite. Make them sign in to save their data to cloud.

#### Cards
1. Use the background blur effect from https://ui.aceternity.com/components/multi-step-loader.
2. Use focus cards to form the base cards from https://ui.aceternity.com/components/focus-cards.
3. 






# Processing Changes
- Debounce changes made and will process only after stopped typing for 2 seconds.
- Then, 

#### Problems
- If blocks deleted or added from starting or any place, whole thing is recomputed.
	- `SOLUTION` -> Create unique identifiers for each block and store order of blocks in a different array.


### Block Identifiers

**Requirements**
1. optimised for storage in DB-> i store them in postgres so i want these blocks to be as optimised for fast reads as db will have many different blocks stored. So i need all blocks to be retrieved, joined and returned for a particular page. So i want as less database reads as possible for this.
2. In metadata of blocks, i will store no of blocks as well in a page. so i will first check if no of blocks in changes are different. If yes, i want to check as fast as i can which blocks have been deleted or added. it will take O(n) normally and if i use bninary search, it will take O(logn).

**Possible Solutions**

1. **DB STORAGE** - Not storing blocks in order but storing their order in another array. 
	



# Learnings

1. Composite Keys are a must.?
	- For content based hashing, if content of the block remains same, for storage, if two blocks have the same content, they will have the same hash.
	- Hence can attach a timestamp at end ie adding 2 attributes to form a composite key.
2.  Use `performance.now()` to measure time taken for running of code.
3. When using shared workers, if I have 2 open tabs and code is basically running a setInterval which increases count every sec, then if 2 tabs are open of same path, then in each value updation only happens once every increase of 2. So one of them runs as 1,3,5,7 and if there are 3 tabs, then it runs as 1,4,7,10 etc. Why does this behavior happen?


# Code Learnings

## Worker
```
self.onmessage = (event) => {
if (event.data == 'start') {
}

setInterval(() => {
count++;
self.postMessage(count);

}, 1000);

console.log(count)

};
```
- `self` refers to the global scope of the worker ie `DedicatedWorkerGlobalScope` which is similar to the `window` scope but not the same.
- `onmessage` to send messages which is accessible by using `event.data` property.
- 





## Observations

- As i am making updates in a webworker, no need to use promises as the webworker works on a thread separate from main thread anyway.
- To make changes in OPFS, I need to know
	1. Structure of data
	2. How operations are being done ie the flow.




## WebRTC


- Create a room with changes being made in roomOwner's data.




## Prisma DB Schema
```
generator client {

provider = "prisma-client-js"

}

  

datasource db {

provider = "postgresql"

url = env("DATABASE_URL")

}

  

model PageSlices {

blockid String @id

pageid String

order Int

content String?

Pages Pages @relation(fields: [pageid], references: [pageid])

  

@@unique([pageid, order])

}

  

model Pages {

title String?

pageid String @id

userOwner String

PageSlices PageSlices[]

User User @relation(fields: [userOwner], references: [username])

}

  

model User {

username String @unique

email String @id

Pages Pages[]

Rooms RoomsCreated[]

}

  

model RoomsCreated{

roomID String @unique @default(uuid())

roomOwner User @relation(fields: [RoomOwner],references: [username])

RoomOwner String

entryMethods RoomEntryMethods

Members String[]

InvitesSent String[]

// changesMade Changes

}

  

enum RoomEntryMethods {

FirstCome

InviteOnly

}

  

// model Changes{

// ChangerPerson

// change

// }

```

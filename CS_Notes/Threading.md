
- A ==thread monkey== is a programmer capable of designing multithreaded, concurrent and parallel software.
- A system is said to be ==concurrent if it can support two or more actions in progress at the same time==. A system is said to be ==parallel if it can support two or more actions executing simultaneously==. The key concept and difference between these definitions is the phrase “in progress.”
- Parallel is a subset of concurrent programming. 



## Execution Model
- In computer systems, synchronization is a little more general; it refers to relationships among events—any number of events, and any kind of relationship (before, during, after).
- Basic Model of execution is when computers execute one instruction after another in sequence. So, if a statement written after another,  it is executed later.
- It can be in two other complicated ways
	- Multiple processors are running on the same time; it's not easy to know which instruction is executed on which processor.
	- Single core processor is executing instructions using multiple threads.
- Scheduler controls which thread runs when.

Puzzle->Assuming that Bob is willing to follow simple instructions, is there any way you can guarantee that tomorrow you will eat lunch before Bob?

- One way is to instruct Bob to start eating lunch only when you call and you call only when you done eating lunch.

### Serialisation 
- 


### Message Passing

- Message passing between threads allows us to control the order of execution.

**Two events are concurrent only if we cannot by looking at the program tell which one will occur first.**

#### Non Determinism
- Concurrent programs are non deterministic ie. we cannot say what will happen during execution

| Thread A    | Thread B   |
| ----------- | ---------- |
| print "yes" | print "no" |
- Because the two threads run concurrently, the order of execution depends on the scheduler. During any given run of this program, the output might be “yes no” or “no yes”.

## Shared Variables

- Usually variables in a thread are local ie. they cannot be accessed by other threads than the one that spawned them.
- But some variables are shared between threads to help pass data between variables.
- If the threads are unsynchronized, then we cannot tell by looking at the program whether the reader will see the value the writer writes or an old value that was already there. Thus many applications enforce the constraint that the reader should not read until after the writer writes.

### Concurrent Writes
| Thread A    | Thread B  |
| ----------- | --------- |
| x = 5(a1)   | x = 7(b1) |
| print x(a2) |           |

- Puzzle: What path yields output 5 and final value 5?  -> b1 < a1 < a2
- Puzzle: What path yields output 7 and final value 7?  -> a1 < b1 < a2
- Puzzle: Is there a path that yields output 7 and final value 5? Can you prove it? -> b1 < a2 < a1

- Can we prove that a given (desirable) effect is necessary or that an (undesirable) effect is impossible?
- Two writes together are **concurrent writes**.
- **Concurrent Updates** are when two threads are perform a read, 


### Concurrent Updates

| Thread A                                 | Thread B                               |
| ---------------------------------------- | -------------------------------------- |
| temp = count(a1)  <br>2 count=temp+1(a2) | temp = count(b1)<br>2 count=temp+1(b2) |

- Both threads race to update a shared variable `count` and one thread's update overwrites the other.
- This is because `count = count + 1` can be interrupted.  An operation that cannot be interrupted is said to be atomic.
- When we say an operation is "interrupted" in the context of concurrent programming, we mean that its execution can be preempted or paused by another thread or process. 
	- **Scheduling:** The operating system's scheduler may decide to switch to another thread or process, pausing the current one.
	- **Hardware Interrupts:** External events like hardware interrupts can cause a thread to be temporarily suspended.
	- **Context Switching:** The operating system may switch the context of the current thread to another thread, allowing the other thread to run.
- The most common alternative is to make the conservative assumption that all updates and all writes are not atomic, and to use synchronization constraints to control concurrent access to shared variables.
- Mutual exclusion guarantees that only one thread accesses a shared variable at a time, eliminating the kinds of synchronization errors in this section.

### Mutual Exclusion
- It is done using messages.
- For example, imagine that you and Bob operate a nuclear reactor that you monitor from remote stations. Most of the time, both of you are watching for warning lights, but you are both allowed to take a break for lunch. It doesn’t matter who eats lunch first, but it is very important that you don’t eat lunch at the same time, leaving the reactor unwatched!
	- Puzzle: Figure out a system of message passing (phone calls) that enforces these restraints. Assume there are no clocks, and you cannot predict when lunch will start or how long it will last. What is the minimum number of messages that is required?

### Links
1. https://www.youtube.com/watch?v=2PjlaUnrAMQ


## Semaphores

- It is an integer with 3 differences
	- It's value cannot be read. Once a value is initialised it can be only be incremented or decremented by one.
	- When its value is incremented, some other thread(which is waiting) is unlocked.
	- When the value is negative, the current thread blocks itself and cannot unblock until another thread increments the value.


### Signaling
- da


### Mutual Exclusion(Mutexes)

- Only one thread will be allowed to access the shared variable at a time.
- It is like a token which can be passed from thread to thread.


> [!note]  #Puzzle
> Add semaphores to the following example to enforce mutual exclusion to the shared variable count.
> 


- Create a semaphore with value 1.
- When with a thread, it should remain 1 and once done, make it 0.
- If 0, need to wait for different thread to release the mutex.
- 



### Terminologies
- When code for different threads is same, its called a `symmetric solution`; else called `asymmetric solution`.
- Code which needs to be prevented from concurrent access is called as `critical section`.
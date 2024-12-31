- Initially should focus on logic of each stage and then worry about combining each class.
- So wanna create an AST only then.
- Modify the shell program to also print out things like a regex.


- We will pass an AST to function which creates an FSM. 
- Then we run input thru the FSM.
- Future idea is to show both using a GUI(written in rust)


### Designing graph system





## Notion Notes

# Resources

1. [https://randomtechthoughts.blog/2021/12/31/finite-state-machines/→Finish](https://randomtechthoughts.blog/2021/12/31/finite-state-machines/%E2%86%92Finish)
2. [https://app.codecrafters.io/courses/grep/stages/cq2→Tasks](https://app.codecrafters.io/courses/grep/stages/cq2%E2%86%92Tasks) needed to finish
3. [https://randomtechthoughts.blog/2021/12/30/regular-expressions/](https://randomtechthoughts.blog/2021/12/30/regular-expressions/)
4. [https://randomtechthoughts.blog/2022/01/01/comparing-regular-expressions-and-finite-state-machines/](https://randomtechthoughts.blog/2022/01/01/comparing-regular-expressions-and-finite-state-machines/)
5. [https://www.cs.cmu.edu/~ab/15-123S10/AnnotatedNotes/Lecture19-12PM.pdf](https://www.cs.cmu.edu/~ab/15-123S10/AnnotatedNotes/Lecture19-12PM.pdf)
6. [https://youtu.be/kb-Ww8HaHuE?si=0YbGRkElkOmA49cT&t=60](https://youtu.be/kb-Ww8HaHuE?si=0YbGRkElkOmA49cT&t=60) → Not a priority rn.
7. Graph
    1. [https://kuczma.dev/articles/rust-graphs/](https://kuczma.dev/articles/rust-graphs/)
    2. [https://depth-first.com/articles/2020/02/03/graphs-in-rust-an-introduction-to-petgraph/](https://depth-first.com/articles/2020/02/03/graphs-in-rust-an-introduction-to-petgraph/)
    3. [https://en.wikipedia.org/wiki/Adjacency_list](https://en.wikipedia.org/wiki/Adjacency_list)
8. Debuggers
    1. [https://developer.apple.com/library/archive/documentation/IDEs/Conceptual/gdb_to_lldb_transition_guide/document/lldb-terminal-workflow-tutorial.html](https://developer.apple.com/library/archive/documentation/IDEs/Conceptual/gdb_to_lldb_transition_guide/document/lldb-terminal-workflow-tutorial.html)
    2. [https://blog.logrocket.com/debugging-rust-apps-with-gdb/](https://blog.logrocket.com/debugging-rust-apps-with-gdb/)
9. Pending
    1. [https://www.educative.io/courses/learn-rust-from-scratch/iterating-over-strings](https://www.educative.io/courses/learn-rust-from-scratch/iterating-over-strings)
    2. [https://www.scaler.com/topics/difference-between-hashmap-and-hashtable/](https://www.scaler.com/topics/difference-between-hashmap-and-hashtable/)
    3. [https://medium.com/basecs/leveling-up-ones-parsing-game-with-asts-d7a6fc2400ff](https://medium.com/basecs/leveling-up-ones-parsing-game-with-asts-d7a6fc2400ff)
    4. [https://www.cs.cornell.edu/courses/cs2112/2018fa/recitations/07ast/ast.pdf](https://www.cs.cornell.edu/courses/cs2112/2018fa/recitations/07ast/ast.pdf)
    5. [https://hasura.io/blog/parser-combinators-walkthrough](https://hasura.io/blog/parser-combinators-walkthrough)
    6. [https://www.snel.com/support/how-regular-expression-works/](https://www.snel.com/support/how-regular-expression-works/)

---

## How Regex works in prod

**1. Parsing and Compilation:**

- **Syntax Analysis:** The crate parses the regular expression string, breaking it down into its constituent parts (e.g., characters, operators, quantifiers).
- **Abstract Syntax Tree (AST):** The parsed expression is represented as an AST, which provides a structured representation of the regular expression.
- **Compilation:** The AST is compiled into an efficient internal representation that can be used for matching. This often involves transforming the AST into a finite state machine (FSM) or a similar data structure.

**2. Finite State Machines (FSMs):**

- **Construction:** The compiled representation of the regular expression is often converted into an FSM, which is a mathematical model that can be used to recognize patterns in a text.
- **Matching:** The FSM is used to process the input text, determining whether it matches the regular expression.

**3. Backtracking:**

- **Handling Quantifiers:** For regular expressions with quantifiers (e.g., ``, `+`, `?`), backtracking algorithms may be used to explore different matching possibilities.
- **Efficiency:** Backtracking can be computationally expensive, so the `regex` crate may employ optimizations to minimize backtracking or avoid it altogether in certain cases.

**4. Optimization:**

- **Caching:** The crate may cache compiled regular expressions to avoid recompilation for repeated use.
- **Efficient Matching:** The crate may use various techniques to optimize the matching process, such as using efficient data structures or algorithms.

### metacharacters

- Characters which are like normal characters but their value is different in a regex.
    - **^** : the hat (or caret) matches the beginning of the line. It can also be used for negation.
    - **$** : the dollar sign matches the end of the line
    - **\d** : matches digits only. Notice the backslash at the beginning? That tells the regex engine that it’s not a string literal.

## Terminologies

1. string literal→

---

# Working of Regex

- `/` is a delimiter. Enclosed in this, is the regex.
- /a/ checks if the letter “a” exists in an expression. It is case sensitive so it catches only a and not A.
- If we wanna make it case insensitive, then we need to pass it an i after the end of the expression. Ex /a/i so it catches a and A.
- If we put /ab/, then it catches the occurrence of “ab” substring(substring as a needs to be immediately followed by b here).

---

# Working of Finite Set Machines

- They are a way of checking if a set of inputs are valid, potentially do some actions while checking.
    
- They’re not something I use all that often, but if I spot that some logic is turning into a tangled mess of if / else it’s sometimes a clue that I should rip it out and replace it with a finite state machine.
    
    ![Screenshot 2024-09-24 at 6.50.53 PM.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/0b66de00-6b4a-42c1-8f6e-aa0d1c1b5c0b/eb89f05b-248c-441c-b350-1fc08ac053ea/Screenshot_2024-09-24_at_6.50.53_PM.png)
    

### Accepting States

- States like B in above example are not accepting states ie. output cannot be in states other than accepting states.
- The arrows are the only ways you can move from one state to another, so you can’t e.g. go directly from A to D.  You start by following the arrow that has no blob at its start, which means you start in state A.  The labels on the arrows are what input you must receive in order to follow that arrow, i.e. to go from A to B you must receive input p.
- C and D are marked as special by having a double outline.  These are _accepting states_.  If the computer is in an accepting state when the input finishes, then the input is valid.  If the computer is in a different state when the input finishes, the input is invalid.
- So, the FSM above will accept _pq_ and _pr_ as valid inputs.  The order matters – _qp_ and _rp_ are invalid.

### Memory

![Screenshot 2024-09-24 at 6.53.16 PM.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/0b66de00-6b4a-42c1-8f6e-aa0d1c1b5c0b/1792c854-9415-49ba-aa1c-9026122ffc07/Screenshot_2024-09-24_at_6.53.16_PM.png)

- This FSM will accept _pqr, pqs, pqt, xyr, xys_ or _xyt_.
- It is very important that once the FSM is in state C, it has no memory from where it took to get there.

![Screenshot 2024-09-24 at 6.59.19 PM.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/0b66de00-6b4a-42c1-8f6e-aa0d1c1b5c0b/5c7c6c7d-249a-4a76-b109-d533268c7eea/Screenshot_2024-09-24_at_6.59.19_PM.png)

If you want the branches available after C to depend on which path you took to get to C then you need to split the FSM up by creating new states.  For instance, if you wanted to restrict the input such that it can only end in t if it started with p, you could build a FSM like this:

### Loops

- They are valid and can be self or loop from different states.
    
    ![Screenshot 2024-09-24 at 7.00.38 PM.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/0b66de00-6b4a-42c1-8f6e-aa0d1c1b5c0b/34f1c0af-aef8-4e0c-9697-606d38541cd2/Screenshot_2024-09-24_at_7.00.38_PM.png)
    
- This FSM can accept y, xy, xxy, xxxy and so on.
    

---

## Abstract Syntax Trees

- Source Code is first split into smaller parts/tokens by `lexical analysis`. Lexical Analysis is also called tokenization.
- They are then parsed into a tree called as a syntax tree by parser.
- An **Abstract Syntax Tree (AST)** abstracts away certain details and retains just enough information to help the compiler understand the structure of the code.

![Screenshot 2024-09-26 at 5.12.10 PM.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/0b66de00-6b4a-42c1-8f6e-aa0d1c1b5c0b/d5f01d6b-fe77-497c-ad6b-e84945a92d38/Screenshot_2024-09-26_at_5.12.10_PM.png)

- First, Tokens created by tokenization. Then, by Syntactic Analysis, AST is created.
- As a first step, you’ll try identifying the nouns, verbs, or more generally, words that matter. Lexical analysis is very similar to this step.
- Well, you’ll now try to **parse the relationship** between the nouns, verbs and the like—to see how they fit together—how they conform to the language’s grammar.

## How to create an AST?

### 2 Pointer Approach

- Initialise 2 pointers, tail and head to start of regex expression; move one and identify according to some characteristics
    - Literal→ Single letter in regex
    - Digits→`\\d` in regex.
    - Alphanumeric→\w in regex
    - Positive Char Groups→Starts with `[` and ends with `]`
    - Negative Char Groups→Starts with `[^` and ends with `]`
    - Ignore whitespaces.
- Once identified, push to given array and move tail to head.

### Coding It

- Can have multiple regex types; hence a vector.
- Each regex type can have a type corresponding to RegexOptions and a valueset.
- So return type of AST is Vec<RegexExpSet> where RegexExpSet={RegexOptions,String}

---

## Problems with grep

1. Hard to understand due to hard syntax; `verbose` and being unreadable.
2. No comments in a regex expression; no whitespaces to break up things.
3. If it goes wrong, it is wrong to understand why due to being densely packed with information.

# Intuition

1. Is FSM a Linked List?
2. Multithreading possible by batching parts of the string, but problem arises when we need to match more than one char; for example “ab” and if “a” at end of batch 1 and “b” at start of batch 2.

## Requirements

1. AST should be a structure which has many children and are sequential/ hierarchical. So anything not in same sequence, is automatically rejected. For example, “\d \d apple” if apple occurs after one occurrence of \d, it should be detected.

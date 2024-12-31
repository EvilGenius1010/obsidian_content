| Link                                            | Metacognition             | Tags               | Code      | Why unable to solve(If applicable) | Approach | Learnings |
| ----------------------------------------------- | ------------------------- | ------------------ | --------- | ---------------------------------- | -------- | --------- |
| https://codeforces.com/problemset/problem/271/D | [[Metacognition Strings]] | #Strings<br>#R1800 | [[Codes]] |                                    |          |           |


- [ ] https://codeforces.com/contest/1016/problem/B ->To do next
- [ ] https://codeforces.com/problemset/problem/271/D ->Finish first
- [ ] https://github.com/debsourav33/CodeForces-Problem-Solutions/blob/master/271D-%20Good%20Substrings.cpp ->Solution for 271D
- [ ] https://www.youtube.com/watch?v=dBGUmUQhjaM&list=PLgUwDviBIf0pcIDCZnxhv0LkHf5KzG9zp ->Finish video


# Polynomial Rolling Hashing Function

$hash(s) = s[0]+s[1]p+s[2]p^2+..s[n-1]*p^{n-1} \ mod \ m$ is the hashing algorithm.

$\qquad = \sum_{i=0}^{n-1} {s[i] * p^i\\\mod\ m}$


- Here, s is the string, p is a prime number ≥ character set. What it means is that p should be ≥ 26 here.
- Why modulo m?
    - to prevent integer overflow. If 11 or 12 char string, then hash becomes extremely large.
- We assign integer values to each of the alphabets and multiply them with p.
- Why p ≥ char set?
    - collision occurring chances increase when not true.
    - $hash(L) = 12$ taking $p=11$ and $hash(”AA”)\ = 11$ when p=11.



# Rabin Karp Algorithm

- Used for string matching. Authored by Rabin and Karp in 1987.
- Given a string s and a text t, we need to see if pattern appears in the text and if yes, give all occurrences in $O(|s|+|t|)$ time.

### Algorithm
- We find the hash for $s$. Then we calculate **hash values** for all prefixes of $t$. We then compare a substring of length $s$ of $t$ with $s$ in constant time using the hashes.
- Then compare each substring of length $|s|$ with the pattern.
- This takes a total time of $O(|t|)$ . So total time is $O(|s|+|t|)$ :$O(|s|)$ for calculating hash of pattern and $O(|t|)$ for comparing each substring of length $|s|$ with the pattern.








# Knuth Morris Pratt Algorithm Search for occurrence of word within string

$\pi[i]\ = \ max_{k=0..i} \{ k: s[0...k-1]\ = \ s[i-(k-1)...i]\}$



### Prefix Function

- Defined as an array $\pi$ of length $n$ where $\pi[i]$ is length of longest substring which is both a `prefix` and `suffix` of the substring.
- Example→"abcabcd” ⇒ $[0,0,0,1,2,3,0]$ . for 1→’a’ , 2→’ab’ , 3→’abc’ ; "aabaaab” ⇒ $[0,1,0,1,2,2,3]$

```
cpp
//Shitty Implementation

vector<int> prefix_fn(string s){

}
```


[[String Learnings]]

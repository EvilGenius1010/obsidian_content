| Link                                             | Metacognition           | Tags | Code | Why unable to solve(If applicable) | Approach | Learnings          |
| ------------------------------------------------ | ----------------------- | ---- | ---- | ---------------------------------- | -------- | ------------------ |
| https://codeforces.com/problemset/problem/1385/A | [[Metacognition Maths]] |      |      |                                    |          |                    |
| https://codeforces.com/problemset/problem/1374/A | [[Metacognition Maths]] |      |      |                                    |          |                    |
| https://codeforces.com/problemset/problem/510/A  |                         |      |      |                                    |          | [[Math Learnings]] |


# Euler's Totient Function
- Denoted by $\phi(n)$.
- Counts the number of positive integers upto $n$ which are co-prime to $n$. Co-prime numbers  mean numbers which share no common factor other than $1$.
- Calculated by using the `Greatest Common Divisor` Algorithm ie. two numbers are considered coprime if their GCD is 1. 

$$ \phi(5)\ = 4 \ \ \ \ \ \  GCD(1,5)=GCD(2,5)=GCD(3,5)=GCD(4,5)=1 $$

>[!NOTE] $\phi(n^k)$ if $n$ is a prime is $n^{k-1}(n-1)$.

>[!NOTE] $\phi(n)$ if $n$ is a prime is $(n-1)$.

>[!NOTE] Co-prime, relatively prime and pairwise co-prime are synonyms. 

>[!NOTE]  $\phi(ab)$ in general is $\phi(a)* \phi(b)*\frac{d}{\phi(d)}$ where $d= gcd(a,b)$



>[!NOTE] $\phi(ab)$ if $a,b$ are relatively prime is $\phi(a)*\phi(b)$.
- This can be proven by using the Chinese Remainder Theorem. `CRT` guarantees that for each $0<=x<a , 0<=y<b$ there exists a unique $0<=z<ab$ with $z \equiv x(mod \ a)$ and $z \equiv y(mod \ b)$. 
- $z$ is coprime with $ab$ only if $x$ is co-prime with $a$ and $y$ with $b$ cuz if not, the factor in common will be a factor of $ab$ as well.
	- 8 and 3, 7 and 2 then 56

# Chinese Remainder Theorem

- It states that given $a,b$ and integers $n1,n2$ which are pairwise co-prime, then there exists a unique  $x$ such that 
- Given pairwise coprime positive integers $n_1,n_2,…,n_k$ and arbitrary integers $a_1,a_2,…,a_k$, the system of simultaneous congruences
$$x≡a1(mod\ n_1) 
\ , x≡a2(mod\ n_2) ...
x≡ak​(mod \ n_k​)$$​has a solution, and the solution is unique modulo $N=n_1,n_2​⋯n_k​$ .









## Modular Arithmetic

### Commonly Used Notation

- $a \equiv b$  where the sign is called congruent modulo.
 >[!NOTE] $a \equiv b \ (mod \ m)$ denotes that $a$ and $b$, when divided by $m$, leave the same remainder.


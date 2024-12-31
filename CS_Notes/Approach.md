
## 371C

- Assume we wanna cook $x$ hamburgers, then we have to find minimum amount of money needed to cook them.
- We know $m_b,m_c,m_s$  are the number of ingredients needed per hamburger.
- Then we need $m_b*x,m_c*x,m_s*x$ amount of ingredients.
- As we already have $n_b,n_c,n_s$ number of ingredients, money needed would be
	- bread: $max(0,m_b*x-n_b)$
	- sausage: $max(0,m_s*x-n_s)$
	- cheese: $max(0,m_c*x-n_c)$
- So, amount of money needed will be $f(x) = max(0,m_c*x-n_c)+max(0,m_s*x-n_s)+max(0,m_b*x-n_b)$
- We perform binary search on this; taking limits as $0$ and $1e12(max \ possible \ money)$
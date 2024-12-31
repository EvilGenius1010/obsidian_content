| Link                                         | Metacognition        | Tags | Code                                                  | Why unable to solve(If applicable) | Approach     | Learnings     |
| -------------------------------------------- | -------------------- | ---- | ----------------------------------------------------- | ---------------------------------- | ------------ | ------------- |
| https://codeforces.com/contest/448/problem/D | [[Metacognition BS]] |      | https://codeforces.com/contest/448/submission/7139620 |                                    | [[Approach]] | [[Learnings]] |



[[Codes]]

# Learnings 

Template for Binary Search
```
function BS(arr,low,high,target){ 
if(low>high){
return -1; 
} 
int mid=(low+high)/2;
if(target==arr[mid]){
return 1; 
} 
else if(target>arr[mid]){ 
BS(arr,mid+1,high,target); 
} 
else if(target<arr[mid]){ 
BS(arr,low,mid,target); 
}
```


- $low≤high$ is the usually base condition for running while loops in BS.
- Logic for Binary Search is that, we initialise two pointers such that one is at the end(call it right) and one at the beginning(call it left) of the search bounds.
- Then run a loop until $left \ < \ right$  for which we compare values of mid(which is $\frac{(left+right)}{2}$)
- Take $left=mid+1$ if $mid$


> [!NOTE] How to avoid integer overflow
> Instead of doing `(l+r)/2`, perform bit shifting using `(l+r)>>1` . The end result is same and also, integer overflow is avoided and it slightly faster.

> [!NOTE] Algorithm for finding Binary Search problems
> When there is a **sorted array** involved, BS is used.
> There is always a constraint in a Binary Search question. 
> Key is to assume a number $x$ and do a binary search on the equations which are to be optimised for the constraint until we can satisfy them.



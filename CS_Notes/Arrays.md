
# Kadane's Algorithm

- For finding maximum sum of subarray.
- Subarrays are continuous parts of arrays.

## Brute Force Solution
- For a given index, all subarrays are a continuous combination from index to end of array.
- Time Complexity is $O(n^3)$ and  Space Complexity is $O(1).$
```
//for a=[3,-1,4,3,-3,9,-6,-1] we can say subarrays for index=0 are [3],[3,-1],
//[3,-1,4],[3,-1,4,3],[3,-1,4,3,-3],[3,-1,4,3,-3,-6]... etc
//for index=2 its [4],[4,3],[4,3,-3],[4,3,-3,9],[4,3,-3,9,-6]
for(i=0;i<n;i++){
for(j=i;j<n;j++){

}
}
```


### Observations
- Instead of adding up the subarrays each time, we can keep a sum variable which keeps track of the sum of the subarrays. Time Complexity is $O(n^2)$ and  Space Complexity is $O(1).$
- But, still we can make it better and hence, we use Kadane's Algorithm.


# Circular Array

- Array is considered to be circular if first element is next to last element.
- They are used to implement queues.
- Suppose $n$ ppl are sitting in a circular queue and we need to print all people from $k^{th}$ index. The simplest solution is to create an array of $2*n$ people such that order is repeated again.
- For example, if $AXJS$ is  the order in which people are sitting, then representation will be $AXJSAXJS$ and if we want to print from, say $k^{th}$ index, we will print characters until we encounter element at $k^{th}$ index again.
- So here, if we wanna print that at $2^{nd}$ index ie $J$ , then we print until we get $J$ again. So it will be $JSAXJ$.

### Efficient Implementation

-  This always will take $2*n$ space. So, we instead use the property of modulo operator.
>[!NOTE] Modulo ensures that when dividing with $k$, output is always a number less than $k$. 

```

```

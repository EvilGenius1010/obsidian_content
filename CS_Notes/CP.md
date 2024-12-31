[[Binary Search]]
[[Math]]
[[Arrays]]
[[Strings]]
[[Tries]]
[[Implementation]]


## Beginner Templates for CP and Optimizations

```
#include <bits/stdc++.h>

using namespace std;
using vi = vector<int>;

void solve() {
    int n;
    cin >> n;
    // Your code here
}

int main() {
    ios::sync_with_stdio(false);
    cin.tie(0);

    int t;
    cin >> t;
    while (t--) solve();
}
```

### Advantages of having separate `solve()` function
- Suppose you submit a code and get a WA(Wrong Answer). You can create another function `solve2()` instead of changing the original code.

### `The sync_with_stdio()` and `cin.tie()` functions

- In C++, the `cin`  and `cout` functions are designed to be automatically synchronised with `printf,scanf` to make C++ backwards compatible with C. 
- But this comes with great performance overhead, especially while reading lots of data.   `sync_with_stdio(false)`  disables this.
- the `cin,cout`  streams are tied together which can lead to unexpected behavior. For example, if you read a line using `getline` from   `cin` it is stored in a buffer until a newline character is found.  `cin.tie(NULL)` or `cin.tie(0)` disables this and prevents output from being buffered until another line is read.


- Instead of writing `endl`, write `\n`  ,write cout << “\n”; instead of cout << endl;. endl is slower because it forces a flushing stream, which is usually unnecessary

#### Flushing Stream

- In C++, a flushing stream refers to a stream whose internal buffer is emptied, forcing any pending output to be written to the underlying device.
- When we write `endl` then anything is immediately written to the console; but is computationally expensive.

### Links
1. https://ncduy0303.github.io/Competitive-Programming/Contest%20Template/main.cpp
2. https://www.google.com/search?q=templates+for+cp&oq=templates+for+cp&gs_lcrp=EgZjaHJvbWUyBggAEEUYOTIJCAEQABgNGIAEMgkIAhAAGA0YgAQyCAgDEAAYFhgeMggIBBAAGBYYHjIICAUQABgWGB4yCAgGEAAYFhgeMggIBxAAGBYYHjIMCAgQABgKGA8YFhgeMgoICRAAGAUYDRge0gEIMzczM2owajGoAgCwAgA&sourceid=chrome&ie=UTF-8
3. https://aryansh.gitbook.io/informatics-notes/syntax-and-templates/quickest-io-library


- [ ] Check math for 723A




# Learnings
- Check whether test cases inputted or not and if not, use SI_template where SI stands for single input and MI for multiple input.
- If integer overflow
	- Taking more input than needed
	- Number larger than defined datatype
- Import every header file which might be needed in the template. If not used, its not included when running the code and its called optional execution.
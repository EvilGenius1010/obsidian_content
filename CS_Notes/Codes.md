
## 448D
```
#include <iostream>
using namespace std;
using vi = vector<int>;
#define ll long long

void solve() {
  int n, m, k;
  cin >> n >> m >> k;
  int left = 1;
  int right = n * m;
  while (left <= right) {
    int mid = left + (right - left) / 2; // prevent integer overflow
    // int mid = (left + right) / 2;
    int t = 0;
    for (int i = 1, j = 1; i <= n && j <= m; i++, j++) {
      // calculate rank
    }
    if (t > k)
      right = mid - 1;
    else if (t < k)
      left = mid + 1;
    else {

      cout << t;
      break;
    }
  }
}

int main() {
  ios::sync_with_stdio(false);
  cin.tie(0);

  // int t;
  // cin >> t;
  // while (t--)
  solve();
}
```



## 271D


- A trie is built having all suffixes of the given string. It is also called #ExplicitSuffixTree.
- 
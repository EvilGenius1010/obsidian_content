```
struct TrieNode{

TrieNode* child[26];

bool isEndOfWord; //used to check if its the end of the word or not.

TrieNode(){ //constructor
isEndOfWord = false;
for (int i = 0; i < 26; i++) {
child[i] = NULL;
}

}
}
```


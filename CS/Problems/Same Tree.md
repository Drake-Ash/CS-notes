---
tags:
  - dsa
  - trees
To_review: true
Status: Complete | Pending review
Link: "[leetcode](https://leetcode.com/problems/same-tree/description/)"
Time_in_minutes: 5
Difficulty: easy
---
# Problem
## Description
Given the roots of two binary trees `p` and `q`, write a function to check if they are the same or not.

Two binary trees are considered the same if they are structurally identical, and the nodes have the same value.

**Example 1:**

![](https://assets.leetcode.com/uploads/2020/12/20/ex1.jpg)

**Input:** p = [1,2,3], q = [1,2,3]
**Output:** true

**Example 2:**

![](https://assets.leetcode.com/uploads/2020/12/20/ex2.jpg)

**Input:** p = [1,2], q = [1,null,2]
**Output:** false

**Example 3:**

![](https://assets.leetcode.com/uploads/2020/12/20/ex3.jpg)

**Input:** p = [1,2,1], q = [1,1,2]
**Output:** false

**Constraints:**

- The number of nodes in both trees is in the range `[0, 100]`.
- `-104 <= Node.val <= 104`
## My solution
```cpp
/**
 * Definition for a binary tree node.
 * struct TreeNode {
 *     int val;
 *     TreeNode *left;
 *     TreeNode *right;
 *     TreeNode() : val(0), left(nullptr), right(nullptr) {}
 *     TreeNode(int x) : val(x), left(nullptr), right(nullptr) {}
 *     TreeNode(int x, TreeNode *left, TreeNode *right) : val(x), left(left), right(right) {}
 * };
 */
class Solution {
public:
    bool isSameTree(TreeNode* p, TreeNode* q) {
        if (p == nullptr && q == nullptr) return true;
        if (p == nullptr || q == nullptr) return false;
        if (p->val != q->val) return false;
        return isSameTree(p->left, q->left) && isSameTree(p->right, q->right);
    }
};
```
## Optimal solution
```cpp
same as above

//iterative

  class Solution {
  public:
      bool isSameTree(TreeNode* p, TreeNode* q) {
          queue<TreeNode *> queue;
          queue.push(p);
          queue.push(q);
          while (queue.size()!=0){
              TreeNode * q2=queue.front();
              queue.pop();
              TreeNode * q1=queue.front();
              queue.pop();
              if (q1==nullptr && q2==nullptr) continue;
              if (q1==nullptr || q2==nullptr) return false;
              if (q1->val!=q2->val) return false;
              queue.push(q1->left);
              queue.push(q2->left);
              queue.push(q1->right);
              queue.push(q2->right);
          }
          return true;
      }
  };
```
## Notes
#dsa
1. Possible solutions - DFS / BFS - traverse nodes together and check for equivalence either iteratively or recursively.
- [ ] Get this under 3 minutes
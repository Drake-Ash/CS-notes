---
tags:
  - dsa
  - trees
To_review: true
Status: Review again
Link: "[leetcode](https://leetcode.com/problems/lowest-common-ancestor-of-a-binary-search-tree/description/)"
Time_in_minutes: 7
Difficulty: medium
---
# Problem
## Description
Given a binary search tree (BST), find the lowest common ancestor (LCA) node of two given nodes in the BST.

According to the [definition of LCA on Wikipedia](https://en.wikipedia.org/wiki/Lowest_common_ancestor): “The lowest common ancestor is defined between two nodes `p` and `q` as the lowest node in `T` that has both `p` and `q` as descendants (where we allow **a node to be a descendant of itself**).”

**Example 1:**

![](https://assets.leetcode.com/uploads/2018/12/14/binarysearchtree_improved.png)

**Input:** root = [6,2,8,0,4,7,9,null,null,3,5], p = 2, q = 8
**Output:** 6
**Explanation:** The LCA of nodes 2 and 8 is 6.

**Example 2:**

![](https://assets.leetcode.com/uploads/2018/12/14/binarysearchtree_improved.png)

**Input:** root = [6,2,8,0,4,7,9,null,null,3,5], p = 2, q = 4
**Output:** 2
**Explanation:** The LCA of nodes 2 and 4 is 2, since a node can be a descendant of itself according to the LCA definition.

**Example 3:**

**Input:** root = [2,1], p = 2, q = 1
**Output:** 2

**Constraints:**

- The number of nodes in the tree is in the range `[2, 105]`.
- `-109 <= Node.val <= 109`
- All `Node.val` are **unique**.
- `p != q`
- `p` and `q` will exist in the BST.
## My solution
```cpp
/**
 * Definition for a binary tree node.
 * struct TreeNode {
 *     int val;
 *     TreeNode *left;
 *     TreeNode *right;
 *     TreeNode(int x) : val(x), left(NULL), right(NULL) {}
 * };
 */

class Solution {
public:
    TreeNode* lowestCommonAncestor(TreeNode* root, TreeNode* p, TreeNode* q) {
        if (root == nullptr) return root;

        if (p->val < root-> val && q->val < root->val)
            return lowestCommonAncestor(root->left, p, q);
        else if (p->val > root-> val && q->val > root->val)
            return lowestCommonAncestor(root->right, p, q);
        else
            return root;
    }
};
```
## Optimal solution

## Notes
#dsa
1. Read the problem before solving, I made the mistake of understanding this as a binary tree problem, but this was a BST. Which is very easy to solve
- [ ] Get this under 5 minutes
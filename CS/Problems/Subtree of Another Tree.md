---
tags:
  - dsa
  - trees
  - important
To_review: true
Status: Review again
Link: "[leetcode](https://leetcode.com/problems/subtree-of-another-tree/description/)"
Time_in_minutes: 25
Difficulty: easy
---
# Problem
## Description
Given the roots of two binary trees `root` and `subRoot`, return `true` if there is a subtree of `root` with the same structure and node values of `subRoot` and `false` otherwise.

A subtree of a binary tree `tree` is a tree that consists of a node in `tree` and all of this node's descendants. The tree `tree` could also be considered as a subtree of itself.

**Example 1:**

![](https://assets.leetcode.com/uploads/2021/04/28/subtree1-tree.jpg)

**Input:** root = [3,4,5,1,2], subRoot = [4,1,2]
**Output:** true

**Example 2:**

![](https://assets.leetcode.com/uploads/2021/04/28/subtree2-tree.jpg)

**Input:** root = [3,4,5,1,2,null,null,null,null,0], subRoot = [4,1,2]
**Output:** false

**Constraints:**

- The number of nodes in the `root` tree is in the range `[1, 2000]`.
- The number of nodes in the `subRoot` tree is in the range `[1, 1000]`.
- `-104 <= root.val <= 104`
- `-104 <= subRoot.val <= 104`
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
    bool isSubtree(TreeNode* root, TreeNode* subRoot) {
        if (root == nullptr) return false;
        else if (isSametree(root, subRoot)) return true;
        return isSubtree(root->left, subRoot) || isSubtree(root->right, subRoot);
    }

    bool isSametree(TreeNode* p, TreeNode* q) {
        if (p == nullptr && q == nullptr) return true;
        if (p == nullptr || q == nullptr) return false;
        if (p->val != q->val) return false;
        return isSametree(p->left, q->left) && isSametree(p->right, q->right);
    }
};
```
## Optimal solution
```cpp
same as above
```
## Notes
#dsa
- [ ] Get this under 5 minutes
1. Think of edge cases before writing the code
2. Edge cases to think about
	1. subRoot = nullptr
	2. multiple matches for subRoot in root
3. Intuition - separate node children checking with tree same checking. i.e
	1. Sub tree traversal should be separate
	2. Same tree check should be separate
---
tags:
  - dsa
  - trees
To_review: true
Status: Complete | Pending review
Link: "[leetcode](https://leetcode.com/problems/maximum-depth-of-binary-tree/description/)"
Time_in_minutes: 6
Difficulty: easy
---
# Problem
## Description
Given the `root` of a binary tree, return _its maximum depth_.

A binary tree's **maximum depth** is the number of nodes along the longest path from the root node down to the farthest leaf node.

**Example 1:**

![](https://assets.leetcode.com/uploads/2020/11/26/tmp-tree.jpg)

**Input:** root = [3,9,20,null,null,15,7]
**Output:** 3

**Example 2:**

**Input:** root = [1,null,2]
**Output:** 2

**Constraints:**

- The number of nodes in the tree is in the range `[0, 104]`.
- `-100 <= Node.val <= 100`
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
    int find_depth(TreeNode *root, int curr_depth) {
        if (root == nullptr) return curr_depth - 1;
        return max(find_depth(root->left, curr_depth+1), find_depth(root->right, curr_depth+1));
    }

    int maxDepth(TreeNode* root) {
        return find_depth(root, 1);
    }
};
```
## Optimal solution
```cpp
same as above
```
## Notes
#dsa
- [ ] Get this under 3 minutes

1. Possible solutions
	1. DFS - recursively pass down height value and increment it, maximise on height value
	2. BFS - push items to queue, count each level, finally return the highest level value
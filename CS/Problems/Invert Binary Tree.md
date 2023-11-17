---
tags:
  - dsa
  - trees
To_review: true
Status: Complete | Pending review
Link: "[leetcode](https://leetcode.com/problems/invert-binary-tree/description/)"
Time_in_minutes: 3
Difficulty: easy
---
# Problem
## Description
Given the `root` of a binary tree, invert the tree, and return _its root_.

**Example 1:**

![](https://assets.leetcode.com/uploads/2021/03/14/invert1-tree.jpg)

**Input:** root = [4,2,7,1,3,6,9]
**Output:** [4,7,2,9,6,3,1]

**Example 2:**

![](https://assets.leetcode.com/uploads/2021/03/14/invert2-tree.jpg)

**Input:** root = [2,1,3]
**Output:** [2,3,1]

**Example 3:**

**Input:** root = []
**Output:** []

**Constraints:**

- The number of nodes in the tree is in the range `[0, 100]`.
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
    TreeNode* invertTree(TreeNode* root) {
        if (root == nullptr) return root;

        TreeNode *temp = root->left;
        root->left = root-> right;
        root->right = temp;
        invertTree(root->left);
        invertTree(root->right);
        return root;
    }
};
```
## Optimal solution
```cpp
same as above
```
## Notes
#dsa
1. Possible solutions - Depends on the traversal of tree
	1. DFS - recursion/iterative(stack) based solution, for each node, swap left and right
	2. BFS - Level order traversal, for each node, swap left and right
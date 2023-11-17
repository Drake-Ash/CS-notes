---
tags:
  - dsa
  - trees
To_review: true
Status: Complete | Pending review
Link: "[leetcode](https://leetcode.com/problems/binary-tree-maximum-path-sum/description/)"
Time_in_minutes: 28
Difficulty: hard
---
# Problem
## Description
A **path** in a binary tree is a sequence of nodes where each pair of adjacent nodes in the sequence has an edge connecting them. A node can only appear in the sequence **at most once**. Note that the path does not need to pass through the root.

The **path sum** of a path is the sum of the node's values in the path.

Given the `root` of a binary tree, return _the maximum **path sum** of any **non-empty** path_.

**Example 1:**

![](https://assets.leetcode.com/uploads/2020/10/13/exx1.jpg)

**Input:** root = [1,2,3]
**Output:** 6
**Explanation:** The optimal path is 2 -> 1 -> 3 with a path sum of 2 + 1 + 3 = 6.

**Example 2:**

![](https://assets.leetcode.com/uploads/2020/10/13/exx2.jpg)

**Input:** root = [-10,9,20,null,null,15,7]
**Output:** 42
**Explanation:** The optimal path is 15 -> 20 -> 7 with a path sum of 15 + 20 + 7 = 42.

**Constraints:**

- The number of nodes in the tree is in the range `[1, 3 * 104]`.
- `-1000 <= Node.val <= 1000`
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
int maxSum = INT_MIN;
public:
    int maxPathSum(TreeNode* root) {
        helper(root);
        return maxSum;
    }

    int helper(TreeNode *root) {
        if (root == nullptr) return 0;

        int leftSum = max(helper(root->left), 0);
        int rightSum = max(helper(root->right), 0);

        maxSum = max(maxSum, root->val + leftSum + rightSum);

        return root->val + max(leftSum, rightSum);
    }
};
```
## Optimal solution
```cpp
same as above
```
## Notes
#dsa
1. Intuition
	1. Traversal helps here.
	2. Understand what choices a node can have. Represent them properly when thinking about recursion
- [ ] Get this under 10 minutes
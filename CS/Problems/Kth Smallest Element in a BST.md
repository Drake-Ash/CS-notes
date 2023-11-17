---
tags:
  - dsa
  - trees
To_review: true
Status: Complete | Pending review
Link: "[leetcode](https://leetcode.com/problems/kth-smallest-element-in-a-bst/description/)"
Time_in_minutes: 11
Difficulty: medium
---
# Problem
## Description
Given the `root` of a binary search tree, and an integer `k`, return _the_ `kth` _smallest value (**1-indexed**) of all the values of the nodes in the tree_.

**Example 1:**

![](https://assets.leetcode.com/uploads/2021/01/28/kthtree1.jpg)

**Input:** root = [3,1,4,null,2], k = 1
**Output:** 1

**Example 2:**

![](https://assets.leetcode.com/uploads/2021/01/28/kthtree2.jpg)

**Input:** root = [5,3,6,2,4,null,null,1], k = 3
**Output:** 3

**Constraints:**

- The number of nodes in the tree is `n`.
- `1 <= k <= n <= 104`
- `0 <= Node.val <= 104`

**Follow up:** If the BST is modified often (i.e., we can do insert and delete operations) and you need to find the kth smallest frequently, how would you optimize?
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
    int kthSmallest(TreeNode* root, int &k) {
        if (root == nullptr) return -1;
        
        int left = kthSmallest(root->left, k);
        if (left != -1) return left;
        k--;
        if (k == 0) return root->val;
        int right = kthSmallest(root->right, k);
        if (right != -1) return right;

        return -1;
    }
};
```
## Optimal solution
```cpp
same as above
```
## Notes
#dsa
1. dry run solution before running it
- [ ] Get this under 7 minutes
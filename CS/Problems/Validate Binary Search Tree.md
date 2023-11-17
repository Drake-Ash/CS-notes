---
tags:
  - dsa
  - trees
To_review: true
Status: Review again
Link: "[leetcode](https://leetcode.com/problems/validate-binary-search-tree/description/)"
Time_in_minutes: 32
Difficulty: medium
---
# Problem
## Description
Given the `root` of a binary tree, _determine if it is a valid binary search tree (BST)_.

A **valid BST** is defined as follows:

- The left 
    
    subtree
    
     of a node contains only nodes with keys **less than** the node's key.
- The right subtree of a node contains only nodes with keys **greater than** the node's key.
- Both the left and right subtrees must also be binary search trees.

**Example 1:**

![](https://assets.leetcode.com/uploads/2020/12/01/tree1.jpg)

**Input:** root = [2,1,3]
**Output:** true

**Example 2:**

![](https://assets.leetcode.com/uploads/2020/12/01/tree2.jpg)

**Input:** root = [5,1,4,null,null,3,6]
**Output:** false
**Explanation:** The root node's value is 5 but its right child's value is 4.

**Constraints:**

- The number of nodes in the tree is in the range `[1, 104]`.
- `-231 <= Node.val <= 231 - 1`
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
    bool isValidBST(TreeNode* root) {
        if (root == nullptr) return true;
        return leftMostCheck(root->left, root->val) && rightMostCheck(root->right, root->val);
    }

    bool leftMostCheck(TreeNode* root, int val) {
        if (root == nullptr) return true;
        if (root->val >= val) return false;

        return leftMostCheck(root->left, root->val)
         && normalCheck(root->right, root->val, val);
    }

    bool rightMostCheck(TreeNode* root, int val) {
        if (root == nullptr) return true;
        if (root->val <= val) return false;

        return rightMostCheck(root->right, root->val)
         && normalCheck(root->left, val, root->val);
    }

    bool normalCheck(TreeNode* root, int low, int high) {
        if (root == nullptr) return true;
        if (root->val <= low || root->val >= high) return false;

        return normalCheck(root->left, low, root->val)
         && normalCheck(root->right, root->val, high);
    }
};
```
## Optimal solution
```cpp
class Solution {
public:
    bool isValidBST(TreeNode* root) {
        return helper(root, LONG_MIN, LONG_MAX);
    }
private:
    bool helper(TreeNode* root, long left, long right){
        if (!root)
            return true;
        if (root->val < right && root->val > left){
            return helper(root->left, left, root->val) && helper(root->right, root->val, right);
        }
        return false;
    }
};
```
## Notes
#dsa
1. Dry run your solution faster before implementation
2. Read the problem properly
- [ ] Get this under 10 minutes
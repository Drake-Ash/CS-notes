---
tags:
  - dsa
  - trees
  - important
To_review: true
Status: Review again
Link: "[leetcode](https://leetcode.com/problems/construct-binary-tree-from-preorder-and-inorder-traversal/description/)"
Time_in_minutes: 30
Difficulty: medium
---
# Problem
## Description
Given two integer arrays `preorder` and `inorder` where `preorder` is the preorder traversal of a binary tree and `inorder` is the inorder traversal of the same tree, construct and return _the binary tree_.

**Example 1:**

![](https://assets.leetcode.com/uploads/2021/02/19/tree.jpg)

**Input:** preorder = [3,9,20,15,7], inorder = [9,3,15,20,7]
**Output:** [3,9,20,null,null,15,7]

**Example 2:**

**Input:** preorder = [-1], inorder = [-1]
**Output:** [-1]

**Constraints:**

- `1 <= preorder.length <= 3000`
- `inorder.length == preorder.length`
- `-3000 <= preorder[i], inorder[i] <= 3000`
- `preorder` and `inorder` consist of **unique** values.
- Each value of `inorder` also appears in `preorder`.
- `preorder` is **guaranteed** to be the preorder traversal of the tree.
- `inorder` is **guaranteed** to be the inorder traversal of the tree.
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
unordered_map<int, int> inorderValueVsIndex;
public:
    TreeNode* buildTree(vector<int>& preorder, vector<int>& inorder) {
        int index = 0;

        for (int i = 0; i < inorder.size(); i++) {
            inorderValueVsIndex[inorder[i]] = i;
        }

        return _buildTree(preorder, inorder, index, 0, preorder.size() - 1);
    }

    TreeNode* _buildTree(vector<int>& preorder, vector<int>& inorder, int &index, int i, int j) {
        if (i > j) return nullptr;

        TreeNode *root = new TreeNode(preorder[index]);
        int mid = inorderValueVsIndex[preorder[index]];
        index++;

        root->left = _buildTree(preorder, inorder, index, i, mid - 1);
        root->right = _buildTree(preorder, inorder, index, mid + 1, j);

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
![[Pasted image 20230928153528.png]]
1. Intuition
	1. take a full tree with 3 levels, write the inorder and preorder for them
	2. see how the value is arranged in inorder when I pick a value from preorder list
- [ ] Get this under 5 minutes
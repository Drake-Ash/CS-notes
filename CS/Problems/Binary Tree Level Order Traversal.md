---
tags:
  - dsa
  - trees
To_review: true
Status: Complete | Pending review
Link: "[leetcode](https://leetcode.com/problems/binary-tree-level-order-traversal/description/)"
Time_in_minutes: 25
Difficulty: medium
---
# Problem
## Description
Given the `root` of a binary tree, return _the level order traversal of its nodes' values_. (i.e., from left to right, level by level).

**Example 1:**

![](https://assets.leetcode.com/uploads/2021/02/19/tree1.jpg)

**Input:** root = [3,9,20,null,null,15,7]
**Output:** [[3],[9,20],[15,7]]

**Example 2:**

**Input:** root = [1]
**Output:** [[1]]

**Example 3:**

**Input:** root = []
**Output:** []

**Constraints:**

- The number of nodes in the tree is in the range `[0, 2000]`.
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
public:
    vector<vector<int>> levelOrder(TreeNode* root) {
        vector<vector<int>> result;
        queue<TreeNode*> q;
        int itemsInCurrLevel = 1;
        q.push(root);

        vector<int> subResult;

        while (!q.empty()) {
            TreeNode *curr = q.front();
            q.pop();
            itemsInCurrLevel--;
            if (curr == nullptr) continue;

            subResult.push_back(curr->val);
            if (curr->left) {
                q.push(curr->left);
            }
            if (curr->right) {
                q.push(curr->right);
            }

            if (itemsInCurrLevel == 0) {
                result.push_back(subResult);
                subResult = {};
                itemsInCurrLevel = q.size();
            }
        }

        return result;
    }
};
```
## Optimal solution
```cpp
same as above
```
## Notes
1. Work on understanding all the values needed for the problem early before solving the problem
- [ ] Get this under 5 minutes
#dsa

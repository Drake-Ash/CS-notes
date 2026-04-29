// Last updated: 29/04/2026, 23:12:16
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
    vector<int> preorderTraversal(TreeNode *root)
    {
        vector<int> *result = new vector<int>;
        recursivePreorder(root, result);
        return (*result);
    }

    void recursivePreorder(TreeNode *root, vector<int> *result)
    {
        if (root == nullptr)
            return;
        result->push_back(root->val);
        recursivePreorder(root->left, result);
        recursivePreorder(root->right, result);
    }
};
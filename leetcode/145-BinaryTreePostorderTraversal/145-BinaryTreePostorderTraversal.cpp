// Last updated: 29/04/2026, 23:12:14
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
    vector<int> postorderTraversal(TreeNode* root) {
        vector<int> result;
        recursivePostorder(root, &result);
        return (result);        
    }

    void recursivePostorder(TreeNode *root, vector<int> *result)
    {
        if (root == nullptr)
            return;
        recursivePostorder(root->left, result);
        recursivePostorder(root->right, result);
        result->push_back(root->val);
    }
};
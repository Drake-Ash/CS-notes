// Last updated: 29/04/2026, 23:12:50
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
    vector<int> inorderTraversal(TreeNode* root) {
        vector<int> *result = new vector<int>;
        recursiveInorder(root, result);
        return (*result);        
    }

    void recursiveInorder(TreeNode *root, vector<int> *result)
    {
        if (root == nullptr)
            return;
        recursiveInorder(root->left, result);
        result->push_back(root->val);
        recursiveInorder(root->right, result);
    }
};
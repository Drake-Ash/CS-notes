// Last updated: 29/04/2026, 23:12:48
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
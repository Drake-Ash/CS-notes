// Last updated: 29/04/2026, 23:12:38
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

        return _buildTree(preorder, index, 0, preorder.size() - 1);
    }

    TreeNode* _buildTree(vector<int> preorder, int &index, int i, int j) {
        if (i > j) return nullptr;

        TreeNode *root = new TreeNode(preorder[index]);
        int mid = inorderValueVsIndex[preorder[index]];
        index++;

        root->left = _buildTree(preorder, index, i, mid - 1);
        root->right = _buildTree(preorder, index, mid + 1, j);

        return root;
    }
};
// Last updated: 29/04/2026, 23:12:45
/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     int val;
 *     TreeNode left;
 *     TreeNode right;
 *     TreeNode() {}
 *     TreeNode(int val) { this.val = val; }
 *     TreeNode(int val, TreeNode left, TreeNode right) {
 *         this.val = val;
 *         this.left = left;
 *         this.right = right;
 *     }
 * }
 */
class Solution {
    public List<List<Integer>> levelOrder(TreeNode root) {
        if(root==null) {
            return new ArrayList<>();
        }
        List<List<Integer>> response = new ArrayList<>();
        Queue<TreeNode> q = new LinkedList<>();
        q.add(root);
        while(!q.isEmpty()) {
            int s = q.size();
            List<Integer> level = new ArrayList<>();
            while(s!=0) {
                TreeNode curr = q.poll();
                level.add(curr.val);
                if(curr.left!=null)
                q.add(curr.left);
                if(curr.right!=null)
                q.add(curr.right);
                s-=1;
            }
            response.add(level);
        }
        return response;
    }
}
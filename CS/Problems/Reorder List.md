---
tags:
  - dsa
  - linked-lists
To_review: true
Status: Complete | Pending review
Link: "[leetcode]()"
Time_in_minutes: 30
Difficulty: medium
---
# Problem
## Description
You are given the head of a singly linked-list. The list can be represented as:

L0 → L1 → … → Ln - 1 → Ln

_Reorder the list to be on the following form:_

L0 → Ln → L1 → Ln - 1 → L2 → Ln - 2 → …

You may not modify the values in the list's nodes. Only nodes themselves may be changed.

**Example 1:**

![](https://assets.leetcode.com/uploads/2021/03/04/reorder1linked-list.jpg)

**Input:** head = [1,2,3,4]
**Output:** [1,4,2,3]

**Example 2:**

![](https://assets.leetcode.com/uploads/2021/03/09/reorder2-linked-list.jpg)

**Input:** head = [1,2,3,4,5]
**Output:** [1,5,2,4,3]

**Constraints:**

- The number of nodes in the list is in the range `[1, 5 * 104]`.
- `1 <= Node.val <= 1000`
## My solution
```cpp
/**
 * Definition for singly-linked list.
 * struct ListNode {
 *     int val;
 *     ListNode *next;
 *     ListNode() : val(0), next(nullptr) {}
 *     ListNode(int x) : val(x), next(nullptr) {}
 *     ListNode(int x, ListNode *next) : val(x), next(next) {}
 * };
 */
class Solution {
public:
    void reorderList(ListNode* head) {
        ListNode *head_ptr = head;
        vector<ListNode*> nodes;

        while (head_ptr != nullptr) {
            nodes.push_back(head_ptr);
            head_ptr = head_ptr->next;
        }

        ListNode *l_ptr, *r_ptr;
        for (int l = 0, r = nodes.size() - 1; l <= r; l++, r--) {
            l_ptr = nodes[l];
            r_ptr = nodes[r];
            l_ptr->next = r_ptr;
            r_ptr->next = l+1 == r || l == r ? nullptr : nodes[l+1];
        }
    }
};
```
## Optimal solution
```cpp
same as above
```
## Notes
#dsa
1. If you can solve the problem with some extra space with good time, don't hesitate to solve it
- [ ] Get this under 5 minutes
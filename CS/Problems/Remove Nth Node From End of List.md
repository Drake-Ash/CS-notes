---
tags:
  - dsa
  - linked-lists
To_review: true
Status: Complete | Pending review
Link: "[leetcode](https://leetcode.com/problems/remove-nth-node-from-end-of-list/description/)"
Time_in_minutes: 12
Difficulty: medium
---
# Problem
## Description
Given the `head` of a linked list, remove the `nth` node from the end of the list and return its head.

**Example 1:**

![](https://assets.leetcode.com/uploads/2020/10/03/remove_ex1.jpg)

**Input:** head = [1,2,3,4,5], n = 2
**Output:** [1,2,3,5]

**Example 2:**

**Input:** head = [1], n = 1
**Output:** []

**Example 3:**

**Input:** head = [1,2], n = 1
**Output:** [1]

**Constraints:**

- The number of nodes in the list is `sz`.
- `1 <= sz <= 30`
- `0 <= Node.val <= 100`
- `1 <= n <= sz`

**Follow up:** Could you do this in one pass?
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
    ListNode* removeNthFromEnd(ListNode* head, int n) {
        ListNode *ahead_ptr = head, *n_ptr = head, *prev = nullptr;
        while (n != 0) {
            ahead_ptr = ahead_ptr->next;
            n--;
        }

        while (ahead_ptr != nullptr) {
            ahead_ptr = ahead_ptr->next;
            prev = n_ptr;
            n_ptr = n_ptr->next;
        }

        if (prev == nullptr) {
            return head->next;
        };

        prev->next = n_ptr->next;
        return head;
    }
};
```
## Optimal solution
```cpp
same as above
```
## Notes
#dsa
- [ ] Get this under 5 minutes
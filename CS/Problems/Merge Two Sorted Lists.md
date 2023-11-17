---
tags:
  - dsa
  - linked-lists
To_review: true
Status: Complete | Pending review
Link: "[leetcode](https://leetcode.com/problems/merge-two-sorted-lists/)"
Time_in_minutes: 16
Difficulty: easy
---
# Problem
## Description
You are given the heads of two sorted linked lists `list1` and `list2`.

Merge the two lists into one **sorted** list. The list should be made by splicing together the nodes of the first two lists.

Return _the head of the merged linked list_.

**Example 1:**

![](https://assets.leetcode.com/uploads/2020/10/03/merge_ex1.jpg)

**Input:** list1 = [1,2,4], list2 = [1,3,4]
**Output:** [1,1,2,3,4,4]

**Example 2:**

**Input:** list1 = [], list2 = []
**Output:** []

**Example 3:**

**Input:** list1 = [], list2 = [0]
**Output:** [0]

**Constraints:**

- The number of nodes in both lists is in the range `[0, 50]`.
- `-100 <= Node.val <= 100`
- Both `list1` and `list2` are sorted in **non-decreasing** order.
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
    ListNode* mergeTwoLists(ListNode* list1, ListNode* list2) {
        ListNode *result = new ListNode();
        ListNode *result_ptr = result, *list1_ptr = list1, *list2_ptr = list2;

        while (list1_ptr != nullptr && list2_ptr != nullptr) {
            if (list1_ptr->val < list2_ptr -> val) {
                result_ptr->next = list1_ptr;
                list1_ptr = list1_ptr->next;
            } else {
                result_ptr->next = list2_ptr;
                list2_ptr = list2_ptr->next;
            }
            result_ptr = result_ptr->next;
        }

        if (list1_ptr) {
            result_ptr->next = list1_ptr;
        }
        if (list2_ptr) {
            result_ptr->next = list2_ptr;
        }

        return result->next;
    }
};
```
## Optimal solution
```cpp
same as above
```
## Notes
#dsa
1. Think about the solution and use proper variable names to make more sense of solution
- [ ] Get this under 5 minutes
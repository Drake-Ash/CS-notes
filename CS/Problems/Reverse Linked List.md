---
tags:
  - dsa
  - linked-lists
To_review: true
Status: Complete
Link: "[leetcode](https://leetcode.com/problems/reverse-linked-list/description/)"
Time_in_minutes: 5
Difficulty: easy
---
# Problem
## Description
Given the `head` of a singly linked list, reverse the list, and return _the reversed list_.

**Example 1:**

![](https://assets.leetcode.com/uploads/2021/02/19/rev1ex1.jpg)

**Input:** head = [1,2,3,4,5]
**Output:** [5,4,3,2,1]

**Example 2:**

![](https://assets.leetcode.com/uploads/2021/02/19/rev1ex2.jpg)

**Input:** head = [1,2]
**Output:** [2,1]

**Example 3:**

**Input:** head = []
**Output:** []

**Constraints:**

- The number of nodes in the list is the range `[0, 5000]`.
- `-5000 <= Node.val <= 5000`

**Follow up:** A linked list can be reversed either iteratively or recursively. Could you implement both?
## My solution
```cpp
/**

 * Definition for singly-linked list.

 * struct ListNode {

 *     int val;

 *     ListNode *next;

 *     ListNode() : val(0), next(nullptr) {}

 *     ListNode(int x) : val(x), next(nullptr) {}

 *     ListNode(int x, ListNode *next) : val(x), next(next) {}

 * };

 */

class Solution {

public:

    ListNode* reverseList(ListNode* head) {

        ListNode *prev = nullptr, *curr = head, *temp;

        while (curr != nullptr) {

            temp = curr->next;

            curr->next = prev;

            prev = curr;

            curr = temp;

        }

        return prev;

    }

};
```
## Optimal solution
```cpp
same as above
```
## Notes
#dsa
- [ ] Get this under 2 minutes
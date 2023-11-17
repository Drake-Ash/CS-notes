---
tags:
  - dsa
  - linked-lists
  - important
To_review: true
Status: Complete | Pending review
Link: "[leetcode](https://leetcode.com/problems/merge-k-sorted-lists/description/)"
Time_in_minutes: 15
Difficulty: hard
---
# Problem
## Description
You are given an array of `k` linked-lists `lists`, each linked-list is sorted in ascending order.

_Merge all the linked-lists into one sorted linked-list and return it._

**Example 1:**

**Input:** lists = [[1,4,5],[1,3,4],[2,6]]
**Output:** [1,1,2,3,4,4,5,6]
**Explanation:** The linked-lists are:
[
  1->4->5,
  1->3->4,
  2->6
]
merging them into one sorted list:
1->1->2->3->4->4->5->6

**Example 2:**

**Input:** lists = []
**Output:** []

**Example 3:**

**Input:** lists = [[]]
**Output:** []

**Constraints:**

- `k == lists.length`
- `0 <= k <= 104`
- `0 <= lists[i].length <= 500`
- `-104 <= lists[i][j] <= 104`
- `lists[i]` is sorted in **ascending order**.
- The sum of `lists[i].length` will not exceed `104`.
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
    ListNode* merge_2_lists(ListNode *a, ListNode *b) {
        ListNode* result =new ListNode();
        ListNode *a_ptr = a, *b_ptr = b, *result_ptr = result;

        while (a && b) {
            if (a->val < b->val) {
                result_ptr->next = a;
                a = a->next;
            } else {
                result_ptr->next = b;
                b = b->next;
            }
            result_ptr = result_ptr->next;
        }

        if (a) result_ptr->next = a;
        if (b) result_ptr->next = b;

        return result->next;
    }

    ListNode* mergeKLists(vector<ListNode*>& lists) {
        if (lists.size() == 0) return nullptr;
        ListNode *result;

        vector<ListNode*> combined_list(lists);

        while (combined_list.size() > 1) {
            vector<ListNode*> temp;
            for (int i = 0; i < combined_list.size() - 1; i += 2) {
                temp.push_back(merge_2_lists(combined_list[i], combined_list[i + 1]));
            }
            if (combined_list.size() % 2 == 1) temp.push_back(combined_list[combined_list.size() - 1]);
            combined_list = temp;
        }

        return combined_list[0];
    }
};
```
## Optimal solution
```cpp
same as above
```
## Notes
#dsa
- [ ] Get this under 10 minutes
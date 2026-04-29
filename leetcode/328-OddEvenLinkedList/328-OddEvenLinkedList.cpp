// Last updated: 29/04/2026, 23:10:45
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
ListNode *oddEvenList(ListNode *head)
    {
        if (head == nullptr)
            return head;
        if (head->next == nullptr)
            return head;

        ListNode *oddHead = head;
        ListNode *evenHead = head->next;
        ListNode *oddptr = head;
        ListNode *evenptr = head->next;

        while (oddptr != nullptr && evenptr != nullptr) {
            oddptr->next = evenptr->next;
            oddptr = oddptr->next;
            if (oddptr != nullptr)
                evenptr->next = oddptr->next;
            evenptr = evenptr->next;
        }

        oddptr = oddHead;
        while (oddptr->next != nullptr) oddptr = oddptr->next;
        oddptr->next = evenHead;

        return oddHead;
    }
};

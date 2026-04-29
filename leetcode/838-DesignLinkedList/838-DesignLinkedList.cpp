// Last updated: 29/04/2026, 23:08:48
class Node
{
public:
    Node *next;
    int value;

public:
    Node();

    Node(int val, Node *nextPointer)
    {
        value = val;
        next = nextPointer;
    }
};

class MyLinkedList
{
    Node *head;

public:
    MyLinkedList()
    {
        head = nullptr;
    }

    /** Get the value of the index-th node in the linked list. If the index is invalid, return -1. */
    int get(int index)
    {
        Node *pointer = head;
        int val = -1;
        while ((index > 0) && (pointer != nullptr))
        {
            pointer = pointer->next;
            index--;
        }

        if ((index == 0) && (pointer != nullptr))
            val = pointer->value;

        return val;
    }

    /** Add a node of value val before the first element of the linked list. After the insertion, the new node will be the first node of the linked list. */
    void addAtHead(int val)
    {
        head = new Node(val, head);
    }

    /** Append a node of value val to the last element of the linked list. */
    void addAtTail(int val)
    {
        Node *pointer = head;
        if (pointer == nullptr)
            addAtHead(val);
        else
        {
            while (pointer->next != nullptr)
                pointer = pointer->next;
            pointer->next = new Node(val, nullptr);
        }
    }

    /** Add a node of value val before the index-th node in the linked list. If index equals to the length of linked list, the node will be appended to the end of linked list. If index is greater than the length, the node will not be inserted. */
    void addAtIndex(int index, int val)
    {
        if (index == 0)
            addAtHead(val);
        else
        {
            Node *pointer = head;
            Node *prevPointer = nullptr;
            while (index > 0 && pointer != nullptr)
            {
                index--;
                prevPointer = pointer;
                pointer = pointer->next;
            }
            if (index == 0)
                prevPointer->next = new Node(val, pointer);
        }
    }

    void printList()
    {
        Node *pointer = head;
        while (pointer != nullptr)
        {
            cout << pointer->value << "->";
            pointer = pointer->next;
        }
        cout << endl;
    }

    /** Delete the index-th node in the linked list, if the index is valid. */
    void deleteAtIndex(int index)
    {
        if (head == nullptr)
            return;
        if (index == 0)
        {
            head = head->next;
        }
        else
        {
            Node *pointer = head;
            Node *prevPointer = nullptr;
            while (index > 0 && pointer != nullptr)
            {
                index--;
                prevPointer = pointer;
                pointer = pointer->next;
            }
            if (index == 0)
            {
                if (pointer == nullptr)
                    return;
                else
                {
                    if (pointer != nullptr)
                        prevPointer->next = pointer->next;
                    else
                        prevPointer->next = nullptr;
                }
            }
        }
    }
};

/**
 * Your MyLinkedList object will be instantiated and called as such:
 * MyLinkedList* obj = new MyLinkedList();
 * int param_1 = obj->get(index);
 * obj->addAtHead(val);
 * obj->addAtTail(val);
 * obj->addAtIndex(index,val);
 * obj->deleteAtIndex(index);
 */
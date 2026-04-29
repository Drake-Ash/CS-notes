// Last updated: 29/04/2026, 23:08:50
class MyHashMap {
public:
    vector<int> hashMap;
    MyHashMap() {
        hashMap = vector<int>(1000001, -1);
    }
    
    int hashKey(int key) {
        return key;
    }

    void put(int key, int value) {
        int hash = hashKey(key);
        hashMap[hash] = value;
    }
    
    int get(int key) {
        int hash = hashKey(key);
        return hashMap[hash];
    }
    
    void remove(int key) {
        int hash = hashKey(key);
        hashMap[hash] = -1;
    }
};

/**
 * Your MyHashMap object will be instantiated and called as such:
 * MyHashMap* obj = new MyHashMap();
 * obj->put(key,value);
 * int param_2 = obj->get(key);
 * obj->remove(key);
 */
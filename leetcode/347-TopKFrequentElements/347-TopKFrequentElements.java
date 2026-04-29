// Last updated: 29/04/2026, 23:10:32
class Solution {
    public int[] topKFrequent(int[] nums, int k) {
        Map<Integer, Integer> m = new HashMap<>();
        for(int num: nums) {
            m.putIfAbsent(num, 0);
            m.put(num, m.get(num)+1);
        }
        PriorityQueue<Map.Entry<Integer, Integer>> pq = new PriorityQueue<>((a,b)->b.getValue()-a.getValue());
        pq.addAll(m.entrySet());
        int[] response = new int[k];
        for(int i=0;i<response.length; i++) {
            response[i] = pq.poll().getKey();
        }
        return response;
    }
}
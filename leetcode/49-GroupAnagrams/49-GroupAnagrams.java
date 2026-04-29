// Last updated: 29/04/2026, 23:13:39
class Solution {
    public String getHash(String a) {
        int[] h = new int[26];
        for(char c: a.toCharArray()) {
            h[c-'a']+=1;
        }
        return Arrays.toString(h);
    }
    public List<List<String>> groupAnagrams(String[] strs) {
        Map<String, List<String>> m = new HashMap<>();
        for(String str: strs) {
            char[] ca = str.toCharArray();
            Arrays.sort(ca);
            String hash = String.valueOf(ca);
            m.putIfAbsent(hash, new ArrayList<>());
            m.get(hash).add(str);
        }
        return new ArrayList<>(m.values());
    }
}
// Last updated: 29/04/2026, 23:14:37
class Solution {
    public int lengthOfLongestSubstring(String s) {
        int maxR = 0;
        Map<Character, Integer> map = new HashMap<>();
        for(int i=0; i<s.length();) {
            Set<Character> set = new HashSet<>();
            int end = i;
            int currLen = 0;
            while(end<s.length() &&!set.contains(s.charAt(end))) {
                set.add(s.charAt(end));
                map.put(s.charAt(end), end);
                currLen+=1;
                end+=1;
            }
            if(end<s.length()) {
                i = map.get(s.charAt(end))+1;
            } else {
                i++;
            }
            maxR = Math.max(currLen, maxR);
        }
        return maxR;
    }
}
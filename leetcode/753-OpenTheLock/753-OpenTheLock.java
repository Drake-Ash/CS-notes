// Last updated: 29/04/2026, 23:08:57
class Solution {
    private List<String> getNextCombos(String currString) {
        List<String> list = new ArrayList<>();
        StringBuilder s = new StringBuilder(currString);
        for (int i = 0; i < 4; i++) {
            String n = s.substring(0, i) + getNextCharacter(Integer.parseInt(String.valueOf(s.charAt(i)))) + s.substring(i + 1, 4);
            String p = s.substring(0, i) + getPreviousCharacter(Integer.parseInt(String.valueOf(s.charAt(i)))) + s.substring(i + 1, 4);
            list.add(n);
            list.add(p);
        }
        return list;
    }

    public int openLock(String[] deadends, String target) {
        int nTurns = 0;
        Queue<String> queue = new LinkedList<>();
        Set<String> deadEndSet = new HashSet<>(List.of(deadends));
        Set<String> visited = new HashSet<>();
        if(deadEndSet.contains("0000")) return -1;
        queue.offer("0000");
        while (!queue.isEmpty()) {
            for(int i=queue.size(); i>0; i--) {
                String currCombo = queue.poll();
                visited.add(currCombo);
                if (Objects.equals(target, currCombo)) {
                    return nTurns;
                }

                List<String> nextCombos = getNextCombos(currCombo);
                for (String nextString : nextCombos) {
                    if (deadEndSet.contains(nextString) || visited.contains(nextString)) {
                        continue;
                    }
                    queue.offer(nextString);
                    deadEndSet.add(nextString);
                }
            }
            nTurns += 1;
        }
        return -1;
    }

    private int getNextCharacter(int n) {
        return n == 9 ? 0 : n + 1;
    }

    private int getPreviousCharacter(int n) {
        return n == 0 ? 9 : n - 1;
    }

    public void main(String[] args) {
        System.out.println(openLock(new String[]{"0201","0101","0102","1212","2002"}, "0202"));
    }
}
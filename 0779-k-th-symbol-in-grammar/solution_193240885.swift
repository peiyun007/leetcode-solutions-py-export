class Solution {
    func kthGrammar(_ N: Int, _ K: Int) -> Int {
        if K == 1 && N == 1 {
            return 0
        }
        if K % 2 == 0 {
            return kthGrammar(N - 1, K / 2) == 0 ? 1 : 0
        } else {
            return kthGrammar(N - 1, (K + 1) / 2) == 0 ? 0 : 1
        }
    }
}
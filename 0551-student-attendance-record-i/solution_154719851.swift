class Solution {
    func checkRecord(_ s: String) -> Bool {
        var count_a = 0
        var preCh: Character = " ", prePreCh: Character = " "
        for ch in s {
            switch(ch) {
                case "A":
                    if count_a < 1 {
                        count_a += 1
                    } else {
                        return false
                    }
                case "L":
                    if preCh == "L" && prePreCh == "L" {
                        return false
                    }
                case "P": break
                default: break
            }
            prePreCh = preCh
            preCh = ch
        }
        return true
    }
}
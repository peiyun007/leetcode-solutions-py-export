class Solution {
    func checkRecord(_ s: String) -> Bool {
        var count_a = 0
        var count_l = 0
        for ch in s {
            switch(ch) {
                case "A":
                    count_l = 0
                    if count_a < 1 {
                        count_a += 1
                    } else {
                        return false
                    }
                case "L":
                    if count_l >= 2 {
                        return false
                    } else {
                        count_l += 1
                    }
                case "P": 
                    fallthrough
                default: 
                    count_l = 0
            }
        }
        return true
    }
}
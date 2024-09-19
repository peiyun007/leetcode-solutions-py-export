class Solution {
    func isUgly(_ num: Int) -> Bool {
        var remain = num
        if remain == 1{
            return true
        }
        if remain == 0 {
            return false
        }
        while remain % 5 == 0 {
            remain = remain / 5
        }
        while remain % 3 == 0 {
            remain = remain / 3
        } 
        while remain % 2 == 0 {
            remain = remain / 2
        }
        return remain == 1
    }
}
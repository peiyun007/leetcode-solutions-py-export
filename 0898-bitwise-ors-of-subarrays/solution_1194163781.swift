class Solution {
    func subarrayBitwiseORs(_ arr: [Int]) -> Int {
        var ans = Set<Int>(arr)
        var cur = Set<Int>()
        var nxt = Set<Int>()
        for num in arr {
            nxt.removeAll()
            nxt.insert(num)
            for x in cur {
                nxt.insert(x | num)
            }
            (nxt, cur) = (cur, nxt)
            ans.formUnion(cur)
        }
        return ans.count
    }
}
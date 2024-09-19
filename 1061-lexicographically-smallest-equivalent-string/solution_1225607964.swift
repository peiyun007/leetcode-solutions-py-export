class Solution {
    var p = [Character: Character]()

    func find(_ x: Character) -> Character {
        let px = p[x] ?? x
        if x == px {
            return x
        }
        p[x] = find(px)
        return p[x] ?? x
    }
    func smallestEquivalentString(_ s1: String, _ s2: String, _ baseStr: String) -> String {
        let arr1 = Array(s1)
        let arr2 = Array(s2)
        for i in 0..<arr1.count {
            var r1 = find(arr1[i])
            var r2 = find(arr2[i])
            if r1 > r2 {
                (r1, r2) = (r2, r1)
            }
            p[r2] = r1
        }
        var ans = Array(baseStr).map {
            find($0)
        }
        return String(ans)
    }
}
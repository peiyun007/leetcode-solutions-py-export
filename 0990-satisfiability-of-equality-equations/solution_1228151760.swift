class Solution {
    var parent = [Character: Character]()
    func equationsPossible(_ equations: [String]) -> Bool {
        for eq in equations {
            var arr = Array(eq)
            if arr[1] == "=" {
                union(arr[0], arr[3])
            }
        }
        for eq in equations {
            var arr = Array(eq)
            if arr[1] == "!" {
                if find(arr[0]) == find(arr[3]) {
                    return false
                }
            }
        }
        return true
    }

    func find(_ x: Character) -> Character {
        let px = parent[x] ?? x
        if px == x {
            return x
        }
        parent[x] = find(px)
        return parent[x] ?? x
    }

    func union(_ x: Character, _ y: Character) {
        var px = find(x)
        var py = find(y)
        if px < py {
            (px, py) = (py, px)
        }
        parent[px] = py
    }
}
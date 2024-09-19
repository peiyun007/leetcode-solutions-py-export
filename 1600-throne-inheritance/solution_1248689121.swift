
class ThroneInheritance {
    var edges = [String: [String]]()
    var dead = Set<String>()
    let king: String

    init(_ kingName: String) {
        king = kingName
    }
    
    func birth(_ parentName: String, _ childName: String) {
        edges[parentName, default: [String]()].append(childName)
    }
    
    func death(_ name: String) {
        dead.insert(name)
    }
    
    func getInheritanceOrder() -> [String] {
        var ans = [String]()
        preOrder(king)
        return ans

        func preOrder(_ name: String) {
            if !dead.contains(name) {
                ans.append(name)
            }
            for child in edges[name, default: [String]()] {
                preOrder(child)
            }
        }
    }
}

/**
 * Your ThroneInheritance object will be instantiated and called as such:
 * let obj = ThroneInheritance(kingName)
 * obj.birth(parentName, childName)
 * obj.death(name)
 * let ret_3: [String] = obj.getInheritanceOrder()
 */
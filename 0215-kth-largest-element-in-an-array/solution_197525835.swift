
public struct Heap<T> {
    var nodes = [T]()
    private var orderCriteria: (T, T) -> Bool
    public init(sort: @escaping (T, T) -> Bool) {
        self.orderCriteria = sort
    }
    public init(array: [T], sort: @escaping (T, T) -> Bool) {
        self.orderCriteria = sort
        configureHeap(from: array)
    }
    
    public var count: Int {
        return nodes.count
    }
    
    private mutating func configureHeap(from array: [T]) {
        self.nodes = array
        for i in stride(from: (nodes.count / 2 - 1), through: 0, by: -1) {
            shiftDown(from: i, until: nodes.count)
        }
    }
    internal mutating func shiftDown(from index: Int, until endIndex: Int) {
        let leftChildIndex = index * 2 + 1
        let rightChildIndex = leftChildIndex + 1
        var firstIndex = index
        
        if leftChildIndex < endIndex && self.orderCriteria(nodes[leftChildIndex], nodes[firstIndex]) {
            firstIndex = leftChildIndex
        }
        if rightChildIndex < endIndex && self.orderCriteria(nodes[rightChildIndex], nodes[firstIndex]) {
            firstIndex = rightChildIndex
        }
        if firstIndex != index {
            nodes.swapAt(index, firstIndex)
            shiftDown(from: firstIndex, until: endIndex)
        }
    }
    public func peek() -> T? {
        return nodes.first
    }
    internal mutating func shiftUp(_ index: Int) {
        var childIndex = index
        let child = nodes[childIndex]
        var parentIndex = (childIndex - 1) / 2
        while childIndex > 0 && self.orderCriteria(child, nodes[parentIndex]) {
            nodes[childIndex] = nodes[parentIndex]
            childIndex = parentIndex
            parentIndex = (childIndex - 1) / 2
        }
        nodes[childIndex] = child
    }
    
    public mutating func insert(_ value: T) {
        nodes.append(value)
        shiftUp(nodes.count - 1)
    }
    
    @discardableResult public mutating func remove() -> T? {
        guard !nodes.isEmpty  else {
            return nil
        }
        if nodes.count == 1 {
            return nodes.removeLast()
        } else {
            let value = nodes[0]
            nodes[0] = nodes.removeLast()
            shiftDown(from: 0, until: nodes.count)
            return value
        }
    }
}

extension Heap {
    public mutating func sort() -> [T] {
        for i in stride(from: nodes.count - 1, through : 1, by : -1) {
            nodes.swapAt(0, i)
            shiftDown(from: 0, until: i)
        }
        return nodes
    }
}

public func heapsort<T>(_ a: [T], sort: @escaping (T, T) -> Bool) -> [T] {
    var heap = Heap(array: a, sort: sort)
    return heap.sort()
}

class Solution {
    func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
        var heap: Heap<Int> = Heap { return $0 < $1 }
        for num in nums {
            if heap.count < k || heap.peek()! < num {
                heap.insert(num)
            }
            if heap.count > k {
                heap.remove()
            }
        }
        return heap.peek() ?? -1
    }
}
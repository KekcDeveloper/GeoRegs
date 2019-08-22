import UIKit

struct GeoObject {
    let id: Int
    let name: String
    let childs: [GeoObject]
}

struct IndexRecord {
    let name: String
    let parent: Int?
    let childs: [Int]
}

func makeIndex(node: GeoObject, parent: Int? = nil) -> [Int: IndexRecord] {
    var childIds = [Int]()
    var result = [Int: IndexRecord]()
    for child in node.childs {
        result.merge(makeIndex(node: child, parent: node.id)) {record, _ in
            return record
        }
        childIds.append(child.id)
    }
    let indexRecord = IndexRecord(name: node.name, parent: parent, childs: childIds)
    result[node.id] = indexRecord
    return result
}

let map = GeoObject(id: 0,
                    name: "Point0",
                    childs: [
                        GeoObject(id: 1,
                                  name: "Point1",
                                  childs: []),
                        GeoObject(id: 2,
                                  name: "Point2",
                                  childs: []),
                        GeoObject(id: 3,
                                  name: "Point3",
                                  childs: [])
    ])

let result = makeIndex(node: map)
for record in result.values {
    print("\(String(describing: record.parent)) " + record.name + " \(record.childs)")
}

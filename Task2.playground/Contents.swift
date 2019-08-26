import Foundation

typealias Completion = ([String]) -> Void
typealias Query = (String, Completion) -> Void

// Test dataset
func fetchFlights(departurePoint: String, completion: Completion) {
    switch departurePoint {
    case "A":
        completion(["B", "C"])
    case "B":
        completion(["D"])
    default:
        completion([])
    }
}

func makeCompletion(route: [String], target: String, resultCompletion: @escaping Completion) -> Completion {
    func flightsFetched(to: [String]) {
        for point in to {
            var newRoute = route
            newRoute.append(point)
            guard point != target else {
                resultCompletion(newRoute)
                return
            }
            let newCompletion = makeCompletion(route: newRoute,
                                               target: target,
                                               resultCompletion: resultCompletion)
            fetchFlights(departurePoint: point,
                         completion: newCompletion)
        }
    }

    return flightsFetched
}

func findRoute(from: String, to: String, query: Query, completion: @escaping Completion) {
    guard from != to else {
        completion([from])
        return
    }
    let stepCompletion = makeCompletion(route: [], target: to) { resultRoute in
        guard !resultRoute.isEmpty else {
            completion(["no wai"])
            return
        }
        var route = [from]
        route.append(contentsOf: resultRoute)
        completion(route)
    }
    query(from, stepCompletion)
}

findRoute(from: "A", to: "D", query: fetchFlights) { list in
    guard !list.isEmpty else {
        print("no wai")
        return
    }
    for point in list {
        print(point)
    }
}

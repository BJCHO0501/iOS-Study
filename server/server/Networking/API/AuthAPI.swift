import Foundation

enum AuthAPI: API {
    case getRestaurantList
    case post
    case search
    
    func path() -> String {
        switch self {
        case .search:
            return "/api/restaurant/search"
        case .getRestaurantList:
            return "/api/restaurant/all"
        case .post:
            return "/post"
        }
    }
}

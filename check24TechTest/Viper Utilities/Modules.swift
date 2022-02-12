import Foundation

public enum Modules: Module {
    case productList
    case productDetail
    
    public var routePath: String {
        switch self {
        case .productList:
            return "EUASApp/ProductList"
        case .productDetail:
            return "EUASApp/ProductDetail"
        }
    }
}

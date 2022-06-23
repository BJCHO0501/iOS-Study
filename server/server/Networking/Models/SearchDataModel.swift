import Foundation

struct tableSearchData {
    let maintitle: String
    let addrestitle: String
    let mainImage: String
    let category: String
    let homePageLink: String
    let roadAddress: String
    
    init (maintext: String, addresstext: String, image: String, category: String, homePageLink: String, roadAddress: String) {
        self.maintitle = maintext
        self.addrestitle = addresstext
        self.mainImage = image
        self.category = category
        self.homePageLink = homePageLink
        self.roadAddress = roadAddress
    }
}

import UIKit
import NotificationCenter

class ExchangeRatesVidgetController: UITableViewController, NCWidgetProviding {

    // MARK: - NCWidgetProviding

    func widgetPerformUpdate(completionHandler: (@escaping (NCUpdateResult) -> Void)) {
        completionHandler(NCUpdateResult.newData)
    }
    
}

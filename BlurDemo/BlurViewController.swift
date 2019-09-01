import UIKit

class BlurViewController: UIViewController {

    private var appDidBecomeActiveObserver: Any?

    override func viewDidLoad() {
        super.viewDidLoad()
        appDidBecomeActiveObserver = createObserver()
    }

    private func appDidBecomeActive() {
        guard let observer = appDidBecomeActiveObserver else {
            return
        }
        NotificationCenter.default.removeObserver(observer)
        self.dismiss(animated: true)
    }

    private func createObserver() -> Any {
        let handler: (Notification) -> Void = { [weak self] _ in
            self?.appDidBecomeActive()
        }
        return NotificationCenter.default.addObserver(forName: UIApplication.didBecomeActiveNotification,
                                                      object: nil,
                                                      queue: OperationQueue.main,
                                                      using: handler)
    }

}

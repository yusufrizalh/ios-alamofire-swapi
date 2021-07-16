protocol Displayable {
    // membuat getter
    var titleLabelText: String { get }
    var subtitleLabelText: String { get }
    var item1: (label: String, value: String) { get }
    var item2: (label: String, value: String) { get }
    var item3: (label: String, value: String) { get }
    var listItems: [String] { get }
}

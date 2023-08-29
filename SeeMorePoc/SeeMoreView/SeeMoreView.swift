//
//  SeeMoreView.swift
//  SeeMorePoc
//
//  Created by Rahul Verma on 09/05/23.
//

import UIKit

class SeeMoreView: UIView {

    @IBOutlet private weak var containerView: UIView!
    @IBOutlet private weak var contentLabel: UILabel!
    @IBOutlet private weak var seeMoreButton: UIButton!

    private let nibName = "SeeMoreView"
    private var minimumLines = 3

    var updateSelection: ((_ onIndex: Int) -> Void)?

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    private func commonInit() {
        guard let view = loadViewFromNib() else { return }
        view.frame = self.bounds
        self.addSubview(view)

        seeMoreButton.applyGradient(withColours: [.white.withAlphaComponent(0.3), .white], gradientOrientation: .horizontal)
    }

    private func loadViewFromNib() -> UIView? {
        let nib = UINib(nibName: nibName, bundle: nil)
        return nib.instantiate(withOwner: self, options: nil).first as? UIView
    }

    @IBAction func seeMoreButtonTapped(_ sender: UIButton) {
        handleTextState(isExpanded: true)
        updateSelection?(sender.tag)
    }

    private func handleTextState(isExpanded: Bool) {
        contentLabel.numberOfLines = isExpanded ? 0 : minimumLines

        if contentLabel.countLines() <= minimumLines {
            seeMoreButton.isHidden = true
        } else {
            seeMoreButton.isHidden = isExpanded
        }
    }

    func setText(text: String, isExpanded: Bool, index: Int, minimumLines: Int = 3) {
        self.minimumLines = minimumLines
        seeMoreButton.tag = index
        contentLabel.text = text
        handleTextState(isExpanded: isExpanded)
    }
}



extension UILabel {
    func countLines() -> Int {

        let rect = CGSize(width: self.bounds.width, height: CGFloat.greatestFiniteMagnitude)
        var labelSize: CGRect

        if let myText = self.text as NSString? {
            labelSize = myText.boundingRect(with: rect, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: self.font as Any], context: nil)
        } else if let myAttributedText = self.attributedText {
            labelSize = myAttributedText.boundingRect(with: rect, options: .usesLineFragmentOrigin, context: nil)
        } else {
            return 0
        }

        // Call self.layoutIfNeeded() if your view uses auto layout
        return Int(ceil(CGFloat(labelSize.height) / self.font.lineHeight))
    }
}

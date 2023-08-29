//
//  ViewController.swift
//  SeeMorePoc
//
//  Created by Rahul Verma on 09/05/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var expansionStatusArr: [Bool] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        strArr.forEach { _ in
            expansionStatusArr.append(false)
        }

        tableView.estimatedRowHeight = 50
        tableView.rowHeight = UITableView.automaticDimension

        tableView.reloadData()
    }


}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return strArr.count
    }

    // create a cell for each table view row
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        // create a new cell if needed or reuse an old one
        let cell = tableView.dequeueReusableCell(withIdentifier: "SeeMoreTableViewCell") as! SeeMoreTableViewCell
        cell.configureCell(with: strArr[indexPath.row], isExpanded: expansionStatusArr[indexPath.row], index: indexPath.row)

        cell.seeMoreView.updateSelection = { [weak self] onIndex in
            let index = IndexPath(row: onIndex, section: 0)
            self?.expansionStatusArr[index.row] = true
            self?.tableView.reloadRows(at: [index], with: .automatic)
        }

        return cell
    }
}

var strArr  = [
    "Nobody really understood Kevin. It wasn't that he was super strange or difficult. It was more that there wasn't enough there that anyone wanted to take the time to understand him. This was a shame as Kevin had many of the answers to the important questions",
    "It was going to rain. The weather forecast didn't say that, but the steel plate in his hip did. ",
    "It was even more of a shame that they'd refuse to listen even if Kevin offered to give them the answers. So, Kevin remained silent, misunderstood, and kept those important answers to life to himself.",
    "The irony of the situation hadn't escaped her. She had taken years to sculpt the perfect persona with the perfect look that she shared on Instagram. She knew her hundreds of thousands of followers envied that life she showed and stayed engaged with her because they wanted that life too.",
    "The truth was that she wanted the perfect life she portrayed more than any of her fans. The fact was that despite all the perfection she shared on social media, her life was actually more of a mess than most.",
    "She wanted rainbow hair. That's what she told the hairdresser. It should be deep rainbow colors, too. She wasn't interested in pastel rainbow hair. She wanted it deep and vibrant so there was no doubt that she had done this on purpose.",
    "He had learned over the years to trust his hip over the weatherman. It was going to rain, so he better get outside and prepare.",
    "She closed her eyes and then opened them again. What she was seeing just didn't make sense. She shook her head seeing if that would help. It didn't. Although it seemed beyond reality, there was no denying she was witnessing a large formation of alien spaceships filling the sky.",
    "All he could think about was how it would all end. There was still a bit of uncertainty in the equation, but the basics were there for anyone to see. reality, there was no denying she was witnessing a large formation of alien spaceships filling the sky",
    "No matter how much he tried to see the positive, it wasn't anywhere to be seen. The end was coming and it wasn't going to be pretty. He collected the plastic trash on a daily basis.",
    "It never seemed to end. Even if he cleaned the entire beach, more plastic would cover it the next day after the tide had come in. Although it was a futile effort that would never be done, he continued to pick up the trash each day.",
    "He was aware there were numerous wonders of this world including the unexplained creations of humankind that showed the wonder of our ingenuity. There are huge heads on Easter Island. ",
    "There are the Egyptian pyramids. There’s Stonehenge. But he now stood in front of a newly discovered monument that simply didn't make any sense and he wondered how he was ever going to be able to explain it."
]


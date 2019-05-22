//
//  ViewController.swift
// 
//

import LBTATools

struct Match {
    let imageName, username: String
}

class MatchCell: LBTAListCell<Match> {
    
    let imageView = CircularImageView(width: 80, image: UIImage(named: "girl"))
    let nameLabel = UILabel(text: "User name", font: .boldSystemFont(ofSize: 14), numberOfLines: 2)
    
    override var item: Match! {
        didSet {
            imageView.image = UIImage(named: item.imageName)
            nameLabel.text = item.username
            
            stack(imageView,
                  nameLabel,
                  spacing: 4,
                  alignment: .center)
        }
    }
}

class MatchesController: LBTAListController<MatchCell, Match>, UICollectionViewDelegateFlowLayout {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        items = [
            .init(imageName: "girl", username: "Scarllet"),
            .init(imageName: "kpop", username: "Chris Evans"),
            .init(imageName: "rdj", username: "Tony Stark"),
            .init(imageName: "eli", username: "Elizabeth"),
            .init(imageName: "tom", username: "Loki"),
            .init(imageName: "brie", username: "Larson"),
            .init(imageName: "thor", username: "Thor")
        ]
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: 100, height: view.frame.height)
    }
}

class Header: UICollectionReusableView {
    
    let newMatchesLabel = UILabel(text: "New Matches", font: .boldSystemFont(ofSize: 14), textColor: #colorLiteral(red: 0.9826290011, green: 0.2883806527, blue: 0.399230808, alpha: 1))
    
    let matchesController = MatchesController(scrollDirection: .horizontal)
    
    let messagesLabel = UILabel(text: "Avengers", font: .boldSystemFont(ofSize: 14), textColor: #colorLiteral(red: 0.9826290011, green: 0.2883806527, blue: 0.399230808, alpha: 1))
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        stack(hstack(newMatchesLabel).padLeft(16),
              matchesController.view,
              hstack(messagesLabel).padLeft(16),
              spacing: 12).padTop(16)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
    
}

//LBTAListController<MessageCell, Message>

class MessagesController: LBTAListHeaderController<MessageCell, Message, Header>, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return .init(width: view.frame.width, height: 180)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Avengers"
        
        items = [
            .init(userProfileImageName: "eli", username: "Elizabeth Olison", text: "Let's go to Mcdonalds and grab a sandwich girl."),
            .init(userProfileImageName: "kpop", username: "Steve-Rogers", text: "I hear wendy's is a better fast food chain"),
            .init(userProfileImageName: "rdj", username: "Downey", text: "Agent rommenoff' miss me"),
            .init(userProfileImageName: "tom", username: "Loki", text: "Kneel"),
            .init(userProfileImageName: "hawkeye", username: "Clint-Barton", text: "ke Hua chore dikhai n diya"),
            .init(userProfileImageName: "brie", username: "Larson", text: "Because before you haven't me."),
            .init(userProfileImageName: "thor", username: "Thor", text: "Hum thor sabke pita")
        ]
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width, height: 100)
    }
}

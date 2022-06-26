import UIKit

class StoryTableView: UIViewController, UITableViewDelegate {

    private var stories: [Story] = [Story]()
    private var myTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        

        let barHeight: CGFloat = UIApplication.shared.statusBarFrame.size.height
        let displayWidth: CGFloat = self.view.frame.width
        let displayHeight: CGFloat = self.view.frame.height

        myTableView = UITableView(frame: CGRect(x: 0, y: barHeight, width: displayWidth, height: displayHeight - barHeight))
        myTableView.rowHeight = UITableView.automaticDimension
        myTableView.register(StoryCell.self, forCellReuseIdentifier: "StoryCell")
        myTableView.dataSource = self
        myTableView.delegate = self
        self.view.addSubview(myTableView)
        
        fetchStories()
        print(self.stories)
    }
    
    func fetchStories() {
        APIManager.sharedManager.getTopStories(onSuccess: {storyArray in
            let grp = DispatchGroup()
            for storyId in storyArray {
                grp.enter()
                APIManager.sharedManager.getItemById(itemId: storyId, onSuccess: {json in
                    let story = Story(book: json)
                    self.stories.append(story)
                    grp.leave()
                }, onFailure: {error in
                })
            }
            grp.notify(queue: .main) {
                self.myTableView.reloadData()
            }
        }, onFailure: {error in
        })
    }

    func createStoryArray() {
//        stories.append(Item(id: 1, deleted: false, by: User(), creationTime: Date(), dead: false, url: "google.com", score: 504, title: "How to learn Rust in 5 minutes", commentCount: 200, storyImage: UIImage(systemName: "heart.fill")))
//    stories.append(Story(storyTitle: "Goodbye Zachtronics", storyImage: UIImage(systemName: "heart.fill")!, storyUrl: "google.com", storyLikeCount: 539, storyCommentCount: 121))
    stories.append(Story())
    stories.append(Story())
    stories.append(Story())
//        stories.append(Story(storyTitle: "SMS phishing is way too easy", storyImage: UIImage(systemName: "heart.fill")!, storyUrl: "google.com", storyLikeCount: 432, storyCommentCount: 226))
//        stories.append(Story(storyTitle: "SMS phishing is way too easy and this is a long story name because I want to test out long story names", storyImage: UIImage(systemName: "heart.fill")!, storyUrl: "google.com", storyLikeCount: 432, storyCommentCount: 226))
    }

}

extension StoryTableView : UITableViewDataSource {
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        print("Num: \(indexPath.row)")
//        print("Value: \(stories[indexPath.row])")
//    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stories.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "StoryCell", for: indexPath) as! StoryCell
        let currentStory = stories[indexPath.row]
        cell.story = currentStory
        return cell
    }
    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 150
//    }
    
}

//
//  DetailViewController.swift
//  ios101-project6-tumblr
//
//  Created by Sid Parmar on 10/23/23.
//

import UIKit
import Nuke

class DetailViewController: UIViewController {
    
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var postImageView: UIImageView!
    
    var post: Post! // Use optional instead of implicitly unwrapped optional.

    override func viewDidLoad() {
        super.viewDidLoad()

        guard let post = post else {
            print("Error: Post not set for DetailViewController")
            // Optionally, you can show an error message or pop the view controller.
            return
        }
        
        // Load the image
        if let photo = post.photos.first, let url = photo.originalSize.url as URL? {
            Nuke.loadImage(with: url, into: postImageView)
        } else {
            print("Error: No photos available for this post")
            // Optionally, set a placeholder image or show an error.
        }
        
        // Set the text
        textView.text = post.caption.trimHTMLTags() // Assuming `trimHTMLTags` handles nil gracefully
    }
}

    
    

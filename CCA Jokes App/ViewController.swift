//
//  ViewController.swift
//  CCA Jokes App
//
//  Created by ssoeuser on 23/8/19.
//  Copyright © 2019 ssoeuser. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let jokesArr = [Joke(punchline: "You, you idiot!!", setup: "Who's the joke here?"),
        Joke(punchline: "Nobody Knows", setup: "What do you call a person with no body and no nose?"),
        Joke(punchline: "I just can't seem to put it down!", setup: "I am reading a book on the History Of Glue."),
        Joke(punchline: "It deep ends", setup: "Is this pool safe for driving?"),
        Joke(punchline: "for keeping me of the strrets.", setup: "I'd like to give a big shoutout to all the sidewalks,"),
        Joke(punchline: "people must be dying to get in there.", setup: "This graveyard looks overcrowded,"),
        Joke(punchline: "Dad: Don't call me later, call me dad", setup: "Child: I will call you later"),
        Joke(punchline: "Hello Hungry, I am dad!", setup: "Dad, I'm hungry"),
        Joke(punchline: "Why do crabs never give to Charity?", setup: "Bcuz they are shellfish!!!")
    ]
    
    @IBOutlet weak var setuplabel: UILabel!
    @IBOutlet weak var whatButton: UIButton!
    @IBOutlet weak var punchlineLabel: UILabel!
    @IBOutlet weak var tapLabel: UILabel!
    @IBOutlet var tapScreenGestRecog: UITapGestureRecognizer!
    
    var currentJoke = 0
    
    fileprivate func setupCurrentJoke() {
        setuplabel.text = jokesArr[currentJoke].setup
        punchlineLabel.text = jokesArr[currentJoke].punchline
        punchlineLabel.isHidden = true
        tapLabel.isHidden = true
        tapScreenGestRecog.isEnabled = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tapScreenGestRecog.isEnabled = true
        setupCurrentJoke()
    }

    @IBAction func whatButtonPressed(_ sender: Any) {
        punchlineLabel.isHidden = false
        tapLabel.isHidden = false
        tapScreenGestRecog.isEnabled = true
    }
    
    //Reset to new joke
    
    fileprivate func alert(title: String, message: String, alert1String: String, alert1Type: UIAlertAction.Style, alert2String: String, alert2Type: UIAlertAction.Style) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString(alert1String, comment: "Default action"), style: alert1Type, handler: { _ in
            NSLog("The \"OK\" alert occured.")
        }))
        alert.addAction(UIAlertAction(title: NSLocalizedString(alert2String, comment: "Default action"), style: alert2Type, handler: { _ in
            NSLog("The \"OK\" alert occured.")
        }))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func tapped(_ sender: Any) {
        if currentJoke >= 8 {
            currentJoke = 0
            alert(title: "Did You Laugh?", message: "🤣", alert1String: "YES!🤣🤣🤣", alert1Type: .default, alert2String: "NO!👿👿👿", alert2Type: .destructive)
            setupCurrentJoke()
        } else {
            currentJoke += 1
            setupCurrentJoke()
        }
    }
    
}

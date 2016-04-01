//
//  ViewController.swift
//  AutoLayout_Challenge6
//
//  Created by Jerry Beers on 8/12/15.
//  Copyright (c) 2015 Razeware. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  var bios: [String]!
  var names: [String]!
  
  @IBOutlet var imageViews: [UIImageView]!
  
  @IBOutlet weak var textView: UITextView!
  @IBOutlet weak var label: UILabel!
  override func viewDidLoad() {
    super.viewDidLoad()
  
    bios = [
      "Ray is an indie software developer currently focusing on iPhone and iPad development, and the administrator of this site. He’s the founder of a small iPhone development studio called Razeware, and is passionate both about making apps and teaching others the techniques to make them.",
      "Vicki Wenderlich discovered a love of digital art in 2009, and has been making app art and digital illustrations ever since. She is passionate about helping people pursue their dreams, and makes free app art for developers available on her website, http://www.vickiwenderlich.com.",
      "Greg is an iOS developer and trainer, and has been on the raywenderlich.com editorial team since 2012. He has been nerding out with computers since the Commodore 64 era in the 80s and continues to this day on the web and on iOS. He likes caffeine, codes with two-space tabs, and writes with semicolons.",
      "Mic Pringle is a developer, editor, podcaster, and video tutorial maker. He's also Razeware's third full-time employee. When not knee-deep in Swift or stood in-front of his green screen, he enjoys spending time with his wife Lucy and their daughter Evie, as-well as attending the football matches of his beloved Fulham FC. You can find Mic on Twitter, GitHub, and Stack Overflow.",
      "Christine is Ray's administrative assistant. She tries to keep order in the ever expanding world of raywenderlich.com so that Ray and the team can stay focused on making more tutorials, books, and apps!"]
    names = ["Ray Wenderlich", "Vicki Wenderlich", "Greg Heo", "Mic Pringle", "Christine Sweigart"]
    add_gesture_to_all_image_views()
  }
  
  func add_gesture_to_all_image_views() {

    imageViews.forEach(){
      let tap_gesture_recognizer:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handle_tap_on_image))
      $0.userInteractionEnabled = true
      $0.addGestureRecognizer(tap_gesture_recognizer)
    }
  }
  
  
  func handle_tap_on_image(sender1: AnyObject){
    
    imageViews.forEach(){
      let width_constraint : NSLayoutConstraint? = $0.constraints.filter(){is_width_identifier($0)}.first
      if let constraint = width_constraint{
        constraint.constant = 50
      }
    }

    let width_constrants : [NSLayoutConstraint?] = sender1.view.constraints.filter() { is_width_identifier($0) }
    
    if let width_constrant = width_constrants.first{
      width_constrant?.constant = 70
    }
  }
  
  var is_width_identifier : (NSLayoutConstraint?) -> Bool = {
    guard let constraint = $0, let identifier = constraint.identifier
      else { return false }
    return identifier.containsString("image_width_constraints")
  }}


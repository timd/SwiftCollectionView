//
//  ViewController.swift
//  SwiftCollectionView
//
//  Created by Tim on 20/07/14.
//  Copyright (c) 2014 Charismatic Megafauna Ltd. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    var collectionViewData = String[]()
    
    let cellIdentifier = "cellIdentifier"
    
    @IBOutlet var collectionView: UICollectionView
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Setup collection view data
        self.setupData()
        
        // Configure collection view
        self.configureCollectionView()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // Configuration methods
    
    func setupData() {
        for index in 0...200 {
            collectionViewData += "Item \(index)"
        }
    }
    
    func configureCollectionView() {
        
        var nibName = UINib(nibName: "CollectionViewCell", bundle: nil)
        self.collectionView.registerNib(nibName, forCellWithReuseIdentifier: self.cellIdentifier)
        
        var flowLayout = UICollectionViewFlowLayout()
        flowLayout.itemSize = CGSizeMake(100.0, 100.0)
        flowLayout.minimumInteritemSpacing = 10.0
        flowLayout.minimumLineSpacing = 10
        flowLayout.scrollDirection = UICollectionViewScrollDirection.Vertical
        
        self.collectionView.collectionViewLayout = flowLayout
        self.collectionView.contentInset = UIEdgeInsets(top: 0, left: 10.0, bottom: 10.0, right: 10.0)
        
    }
    
    // UICollectionViewDatasource methods
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView!) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView!, numberOfItemsInSection section: Int) -> Int {
        return self.collectionViewData.count
    }

    func collectionView(collectionView: UICollectionView!, cellForItemAtIndexPath indexPath: NSIndexPath!) -> UICollectionViewCell! {
        
        var cell = collectionView.dequeueReusableCellWithReuseIdentifier(self.cellIdentifier, forIndexPath: indexPath) as UICollectionViewCell
        var label:UILabel = cell.viewWithTag(999) as UILabel
        label.text = self.collectionViewData[indexPath.row]
        
        return cell
        
    }
    
    // UICollectionViewDelegate methods
    func collectionView(collectionView: UICollectionView!, didSelectItemAtIndexPath indexPath: NSIndexPath!) {

        var alert = UIAlertController(title: "Item selected", message: "Selected item \(indexPath.row)", preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Cancel, handler: nil))
        self.presentViewController(alert, animated: true, completion: nil)
        
    }

}


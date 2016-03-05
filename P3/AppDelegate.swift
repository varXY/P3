//
//  AppDelegate.swift
//  P3
//
//  Created by Bobo on 1/22/16.
//  Copyright © 2016 myname. All rights reserved.
//

import UIKit
import CoreData
import AVFoundation


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
	let scoreModel = ScoreModel()
	let chinese = Chinese()

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {

		window = UIWindow(frame: UIScreen.mainScreen().bounds)
		window!.backgroundColor = UIColor.whiteColor()

		// MARK: Shortcut

		var shouldPerformAdditionalDelegateHandling = true

		if let shortcutItem = launchOptions?[UIApplicationLaunchOptionsShortcutItemKey] as? UIApplicationShortcutItem {

			launchedShortcutItem = shortcutItem

			shouldPerformAdditionalDelegateHandling = false
		}

		if let shortcutItems = application.shortcutItems where shortcutItems.isEmpty {

			let shortcut1 = UIApplicationShortcutItem(type: ShortcutIdentifier.First.type, localizedTitle: Titles.homepageBigButtons[0], localizedSubtitle: nil, icon: UIApplicationShortcutIcon(type: .Play), userInfo: [
				AppDelegate.applicationShortcutUserInfoIconKey: UIApplicationShortcutIconType.Play.rawValue
				])

			let shortcut2 = UIApplicationShortcutItem(type: ShortcutIdentifier.Second.type, localizedTitle: Titles.homepageBigButtons[1], localizedSubtitle: nil, icon: UIApplicationShortcutIcon(type: .Play), userInfo: [
				AppDelegate.applicationShortcutUserInfoIconKey: UIApplicationShortcutIconType.Play.rawValue
				])

			let shortcut3 = UIApplicationShortcutItem(type: ShortcutIdentifier.Third.type, localizedTitle: Titles.homepageBigButtons[2], localizedSubtitle: nil, icon: UIApplicationShortcutIcon(type: .Play), userInfo: [
				AppDelegate.applicationShortcutUserInfoIconKey: UIApplicationShortcutIconType.Play.rawValue
				])

			application.shortcutItems = [shortcut1, shortcut2, shortcut3]
		}
		
		// MARK: Base

		let homepageVC = HomepageViewController()
		homepageVC.scoreModel = scoreModel
		homepageVC.chinese = chinese
		let navi = NavigationController(rootViewController: homepageVC)
		navi.setNavigationBarHidden(true, animated: true)
		window?.rootViewController = navi

		try! AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryAmbient)

		window?.makeKeyAndVisible()

        return shouldPerformAdditionalDelegateHandling
    }


	func applicationDidBecomeActive(application: UIApplication) {
		guard let shortcut = launchedShortcutItem else { return }
		handleShortCutItem(shortcut)
		launchedShortcutItem = nil
	}

	func application(application: UIApplication, performActionForShortcutItem shortcutItem: UIApplicationShortcutItem, completionHandler: (Bool) -> Void) {
		let handledShortCutItem = handleShortCutItem(shortcutItem)
		completionHandler(handledShortCutItem)
	}

	func applicationDidEnterBackground(application: UIApplication) {
		scoreModel.saveScores()
	}

    func applicationWillTerminate(application: UIApplication) {
        scoreModel.saveScores()
        self.saveContext()
    }

	// MARK: Shortcut

	enum ShortcutIdentifier: String {
		case First
		case Second
		case Third

		init?(fullType: String) {
			guard let last = fullType.componentsSeparatedByString(".").last else { return nil }

			self.init(rawValue: last)
		}

		var type: String {
			return NSBundle.mainBundle().bundleIdentifier! + ".\(self.rawValue)"
		}
	}

	static let applicationShortcutUserInfoIconKey = "applicationShortcutUserInfoIconKey"

	var launchedShortcutItem: UIApplicationShortcutItem?

	func handleShortCutItem(shortcutItem: UIApplicationShortcutItem) -> Bool {

		var handled = false

		guard let controller = window!.rootViewController as! NavigationController? else { return false }
		guard let homePageVC = controller.viewControllers[0] as? HomepageViewController else { return false }

		guard ShortcutIdentifier(fullType: shortcutItem.type) != nil else { return false }

		guard let shortCutType = shortcutItem.type as String? else { return false }

		switch (shortCutType) {
		case ShortcutIdentifier.First.type:
			chinese.getOneForSameOrNot()
			homePageVC.goToPageBaseOnTag(0)
			handled = true
			break
		case ShortcutIdentifier.Second.type:
			homePageVC.goToPageBaseOnTag(1)
			handled = true
			break
		case ShortcutIdentifier.Third.type:
			chinese.getOneForSpell()
			homePageVC.goToPageBaseOnTag(2)
			handled = true
			break
		default:
			break
		}
		
		
		
		return handled
	}

    // MARK: - Core Data stack

    lazy var applicationDocumentsDirectory: NSURL = {
        let urls = NSFileManager.defaultManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)
        return urls[urls.count-1]
    }()

    lazy var managedObjectModel: NSManagedObjectModel = {
        let modelURL = NSBundle.mainBundle().URLForResource("P3", withExtension: "momd")!
        return NSManagedObjectModel(contentsOfURL: modelURL)!
    }()

    lazy var persistentStoreCoordinator: NSPersistentStoreCoordinator = {
        let coordinator = NSPersistentStoreCoordinator(managedObjectModel: self.managedObjectModel)
		let path = NSBundle.mainBundle().pathForResource("SingleViewCoreData", ofType: "sqlite")
		let url = NSURL.fileURLWithPath(path!, isDirectory: false)
		let options = [NSMigratePersistentStoresAutomaticallyOption: true, NSInferMappingModelAutomaticallyOption: true, NSReadOnlyPersistentStoreOption: true]
        var failureReason = "There was an error creating or loading the application's saved data."

        do {
            try coordinator.addPersistentStoreWithType(NSSQLiteStoreType, configuration: nil, URL: url, options: options)
        } catch {
            var dict = [String: AnyObject]()
            dict[NSLocalizedDescriptionKey] = "Failed to initialize the application's saved data"
            dict[NSLocalizedFailureReasonErrorKey] = failureReason

            dict[NSUnderlyingErrorKey] = error as NSError
            let wrappedError = NSError(domain: "YOUR_ERROR_DOMAIN", code: 9999, userInfo: dict)
            NSLog("Unresolved error \(wrappedError), \(wrappedError.userInfo)")
            abort()
        }
        
        return coordinator
    }()

    lazy var managedObjectContext: NSManagedObjectContext = {
        // Returns the managed object context for the application (which is already bound to the persistent store coordinator for the application.) This property is optional since there are legitimate error conditions that could cause the creation of the context to fail.
        let coordinator = self.persistentStoreCoordinator
        var managedObjectContext = NSManagedObjectContext(concurrencyType: .MainQueueConcurrencyType)
        managedObjectContext.persistentStoreCoordinator = coordinator
        return managedObjectContext
    }()

    // MARK: - Core Data Saving support

    func saveContext () {
        if managedObjectContext.hasChanges {
            do {
                try managedObjectContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                NSLog("Unresolved error \(nserror), \(nserror.userInfo)")
                abort()
            }
        }
    }

}


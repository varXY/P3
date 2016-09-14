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
	var chinese = Chinese()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

		window = UIWindow(frame: UIScreen.main.bounds)
		window!.backgroundColor = UIColor.white

		// MARK: Shortcut

		var shouldPerformAdditionalDelegateHandling = true

		if let shortcutItem = launchOptions?[UIApplicationLaunchOptionsKey.shortcutItem] as? UIApplicationShortcutItem {

			launchedShortcutItem = shortcutItem

			shouldPerformAdditionalDelegateHandling = false
		}

		if let shortcutItems = application.shortcutItems , shortcutItems.isEmpty {

			let shortcut1 = UIApplicationShortcutItem(type: ShortcutIdentifier.First.type, localizedTitle: Titles.homepageBigButtons[0], localizedSubtitle: nil, icon: UIApplicationShortcutIcon(type: .play), userInfo: [
				AppDelegate.applicationShortcutUserInfoIconKey: UIApplicationShortcutIconType.play.rawValue
				])

			let shortcut2 = UIApplicationShortcutItem(type: ShortcutIdentifier.Second.type, localizedTitle: Titles.homepageBigButtons[1], localizedSubtitle: nil, icon: UIApplicationShortcutIcon(type: .play), userInfo: [
				AppDelegate.applicationShortcutUserInfoIconKey: UIApplicationShortcutIconType.play.rawValue
				])

			let shortcut3 = UIApplicationShortcutItem(type: ShortcutIdentifier.Third.type, localizedTitle: Titles.homepageBigButtons[2], localizedSubtitle: nil, icon: UIApplicationShortcutIcon(type: .play), userInfo: [
				AppDelegate.applicationShortcutUserInfoIconKey: UIApplicationShortcutIconType.play.rawValue
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


	func applicationDidBecomeActive(_ application: UIApplication) {
		guard let shortcut = launchedShortcutItem else { return }
		let _ = handleShortCutItem(shortcut)
		launchedShortcutItem = nil
	}

	func application(_ application: UIApplication, performActionFor shortcutItem: UIApplicationShortcutItem, completionHandler: @escaping (Bool) -> Void) {
		let handledShortCutItem = handleShortCutItem(shortcutItem)
		completionHandler(handledShortCutItem)
	}

	func applicationDidEnterBackground(_ application: UIApplication) {
		scoreModel.saveScores()
	}

    func applicationWillTerminate(_ application: UIApplication) {
        scoreModel.saveScores()
        saveContext()
    }

	// MARK: Shortcut

	enum ShortcutIdentifier: String {
		case First
		case Second
		case Third

		init?(fullType: String) {
			guard let last = fullType.components(separatedBy: ".").last else { return nil }

			self.init(rawValue: last)
		}

		var type: String {
			return Bundle.main.bundleIdentifier! + ".\(self.rawValue)"
		}
	}

	static let applicationShortcutUserInfoIconKey = "applicationShortcutUserInfoIconKey"

	var launchedShortcutItem: UIApplicationShortcutItem?

	func handleShortCutItem(_ shortcutItem: UIApplicationShortcutItem) -> Bool {

		var handled = false

		guard let controller = window!.rootViewController as! NavigationController? else { return false }
		guard let homePageVC = controller.viewControllers[0] as? HomepageViewController else { return false }

		guard ShortcutIdentifier(fullType: shortcutItem.type) != nil else { return false }

		guard let shortCutType = shortcutItem.type as String? else { return false }

		var index  = 0
		switch (shortCutType) {
		case ShortcutIdentifier.First.type:
			chinese.getOneForSameOrNot()

		case ShortcutIdentifier.Second.type:
			index = 1

		case ShortcutIdentifier.Third.type:
			index = 2
			chinese.getOneForSpell()

		default:
			break
		}

		homePageVC.chinese = chinese
		homePageVC.goToPageBaseOnTag(index)
		handled = true

		return handled
	}

    // MARK: - Core Data stack

    lazy var applicationDocumentsDirectory: URL = {
        let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return urls[urls.count-1]
    }()

    lazy var managedObjectModel: NSManagedObjectModel = {
        let modelURL = Bundle.main.url(forResource: "P3", withExtension: "momd")!
        return NSManagedObjectModel(contentsOf: modelURL)!
    }()

    lazy var persistentStoreCoordinator: NSPersistentStoreCoordinator = {
        let coordinator = NSPersistentStoreCoordinator(managedObjectModel: self.managedObjectModel)
		let path = Bundle.main.path(forResource: "SingleViewCoreData", ofType: "sqlite")
		let url = URL(fileURLWithPath: path!, isDirectory: false)
		let options = [NSMigratePersistentStoresAutomaticallyOption: true, NSInferMappingModelAutomaticallyOption: true, NSReadOnlyPersistentStoreOption: true]
        var failureReason = "There was an error creating or loading the application's saved data."

        do {
            try coordinator.addPersistentStore(ofType: NSSQLiteStoreType, configurationName: nil, at: url, options: options)
        } catch {
            var dict = [String: AnyObject]()
            dict[NSLocalizedDescriptionKey] = "Failed to initialize the application's saved data" as AnyObject?
            dict[NSLocalizedFailureReasonErrorKey] = failureReason as AnyObject?

            dict[NSUnderlyingErrorKey] = error as NSError
            let wrappedError = NSError(domain: "YOUR_ERROR_DOMAIN", code: 9999, userInfo: dict)
            NSLog("Unresolved error \(wrappedError), \(wrappedError.userInfo)")
            abort()
        }
        
        return coordinator
    }()

    lazy var managedObjectContext: NSManagedObjectContext = {
        let coordinator = self.persistentStoreCoordinator
        var managedObjectContext = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
        managedObjectContext.persistentStoreCoordinator = coordinator
        return managedObjectContext
    }()

    // MARK: - Core Data Saving support

    func saveContext () {
        if managedObjectContext.hasChanges {
            do {
                try managedObjectContext.save()
            } catch {
                let nserror = error as NSError
                NSLog("Unresolved error \(nserror), \(nserror.userInfo)")
                abort()
            }
        }
    }

}


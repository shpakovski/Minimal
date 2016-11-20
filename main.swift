import Cocoa

// Mark process as GUI
NSApplication.shared().setActivationPolicy(.regular)

// Add the command Quit to the empty menubar
let mainMenu = NSMenu()
let appMenu = NSMenu()
let appName = ProcessInfo.processInfo.processName
let mainMenuItem = NSMenuItem()
let quitMenuItem = NSMenuItem(title: "Quit " + appName, action: #selector(NSApplication.terminate(_:)), keyEquivalent: "q")
mainMenu.addItem(mainMenuItem)
mainMenuItem.submenu = appMenu
appMenu.addItem(quitMenuItem)
NSApp.mainMenu = mainMenu

// Show an empty centered window
let mainWindow = NSWindow(contentRect: NSMakeRect(0, 0, 200, 100), styleMask: .titled, backing: .buffered, defer: false)
mainWindow.center()
mainWindow.title = appName
mainWindow.makeKeyAndOrderFront(nil)

// Activate the running app once the window becomes visible
OperationQueue.main.addOperation {
	NSApp.activate(ignoringOtherApps: true)
}
NSApp.run()

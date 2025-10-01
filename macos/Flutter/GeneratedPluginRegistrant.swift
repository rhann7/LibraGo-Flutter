//
//  Generated file. Do not edit.
//

import FlutterMacOS
import Foundation

<<<<<<< HEAD
import path_provider_foundation
import shared_preferences_foundation

func RegisterGeneratedPlugins(registry: FlutterPluginRegistry) {
  PathProviderPlugin.register(with: registry.registrar(forPlugin: "PathProviderPlugin"))
=======
import file_selector_macos
import shared_preferences_foundation

func RegisterGeneratedPlugins(registry: FlutterPluginRegistry) {
  FileSelectorPlugin.register(with: registry.registrar(forPlugin: "FileSelectorPlugin"))
>>>>>>> 886e27c5e422ea82f6925887e9e021ce49b1c6e5
  SharedPreferencesPlugin.register(with: registry.registrar(forPlugin: "SharedPreferencesPlugin"))
}

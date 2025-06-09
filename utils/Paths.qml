pragma Singleton

import Quickshell
import Qt.labs.platform

Singleton {
  id: root

  readonly property url root: `${StandardPaths.standardLocations(StandardPaths.ConfigLocation)[0]}/quickshell/cwc`
}

### Civ 6 Configuration Editor

This AutoHotkey script allows you to modify Civilization VI's configuration file (`AppOptions.txt`) based on your system's CPU specifications. The tool provides a graphical user interface (GUI) to simplify the process of selecting the configuration file, previewing calculated changes, and applying them automatically.

#### Features
- **GUI for easy file selection and configuration changes**
- **Automatic detection of CPU type (Intel or AMD) and number of threads**
- **Customized thread settings based on CPU type to optimize game performance**
- **Preview mode to see calculated values before applying changes**
- **Automatic updates of the `AppOptions.txt` file with new thread settings**

#### How It Works
1. **File Selection:** The user selects the `AppOptions.txt` file used by Civilization VI.
2. **Preview Changes:** The script calculates optimal values for game settings based on the CPU's brand and thread count:
   - For CPUs with more than 6 threads, default values are used (`MaxGameCoreThreads = 6`, `MaxJobThreads = 5`).
   - For Intel CPUs with 6 or fewer threads, all available threads are used for both game core and job threads.
   - For AMD CPUs with 6 or fewer threads, job threads are set to `MaxGameCoreThreads - 2` (with a minimum of 1).
   - Other calculated settings include `MaxGameCoreUnitMovementThreads` and `MaxGameCoreTradeRouteThreads`.
3. **Apply Changes:** The selected configuration file is updated to reflect the new values.

#### Installation and Usage
You have two options for running this script:

1. **Download the compiled `.exe` file from the [GitHub Releases](https://github.com/YourRepoHere) page (not recommended).**
   - **Note:** Downloading the pre-compiled executable poses some risks. It is always safer to run/build the script from source code.

2. **Install [AutoHotkey](https://www.autohotkey.com/) and run the script manually:**
   - Download and install AutoHotkey.
   - Clone or download the source code from the GitHub repository.
   - Double-click the `.ahk` script file to run it, or compile it yourself into an `.exe` using AutoHotkey's compiler.
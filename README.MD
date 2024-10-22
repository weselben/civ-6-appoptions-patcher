### Sid Meier's Civilization VI 6 Patcher

This patcher allows you to modify Civilization VI's configuration file (`AppOptions.txt`) to fix performance and desynchronization issues based on your system's CPU specifications. The tool provides a graphical user interface (GUI) to simplify the process of selecting the configuration file, previewing calculated changes, and applying them automatically.

#### Features
- **GUI for easy file selection and configuration changes**
- **Automatic detection of CPU type (Intel or AMD) and number of threads**
- **Customized thread settings based on CPU type to optimize game performance**
- **Preview mode to see calculated values before applying changes**
- **Automatic updates of the `AppOptions.txt` file with new thread settings**

#### How It Works
1. **File Selection:** Select the `AppOptions.txt` file used by Civilization VI. The default file destination for Steam is typically one of the following:
   - `C:\Users\<user>\AppData\Local\Firaxis Games\Sid Meier's Civilization VI\AppOptions.txt`
   - `%LocalAppData%\Firaxis Games\Sid Meier's Civilization VI\AppOptions.txt`
2. **Preview Changes:** The patcher calculates optimal values for game settings based on your CPU's brand and thread count:
   - For CPUs with more than 6 threads, default values are used (`MaxGameCoreThreads = 6`, `MaxJobThreads = 5`).
   - For Intel CPUs with 6 or fewer threads, all available threads are used for both game core and job threads.
   - For AMD CPUs with 6 or fewer threads, job threads are set to `MaxGameCoreThreads - 2` (with a minimum of 1).
   - Other calculated settings include `MaxGameCoreUnitMovementThreads` and `MaxGameCoreTradeRouteThreads`.
3. **Apply Changes:** The selected configuration file is updated to reflect the new values.

#### Installation and Usage
You have two options for running this patcher:

1. **Download the compiled `.exe` file from the [GitHub Releases](https://github.com/weselben/civ-6-appoptions-patcher/releases) page (not recommended).**
   - **Note:** Downloading the pre-compiled executable poses some risks. It is always safer to run/build the patcher from source code.

2. **Run the patcher manually:**
   - Clone or download the source code from the GitHub repository.
   - Execute the patcher to run it, or compile it yourself into an `.exe` using the provided tools.

#### Contributions
Developers and tinkerers are encouraged to make pull requests or report issues to help improve the patcher and fix any bugs.

*Credit: Information on the default file destination was sourced from [this Reddit post](https://www.reddit.com/r/civ6/comments/11zsanh/comment/lpb4gcy/?utm_source=share&utm_medium=web3x&utm_name=web3xcss&utm_term=1&utm_content=share_button).*

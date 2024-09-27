# uhhh

`uhhh` is a tiny command line tool for when you forget what you were working on. Run it in any git repo to refresh your memory.


```
uhhh
```

```
You were working on a tool that interacts with a Git repository and uses an Ollama model to summarize commits.

* The recent commit `57467c7` cleaned up the usage instructions and removed redundant comments.
* The commit `0fa3a3a` introduced a function to truncate diffs, likely for brevity in the output.
```

## Installation

Requires [Ollama](https://ollama.com/) installed, and enough memory to run your model of choice.

You can install `uhhh` by downloading the script and placing it in a directory that's part of your system's `PATH`.


1. **Download the Script**

   Clone the repository.

   ```bash
   git clone https://github.com/nhagar/uhhh.git
   ```

2. **Make the Script Executable**

   Navigate to the directory containing the `uhhh` script and modify its permissions to make it executable.

   ```bash
   chmod +x uhhh
   ```

3. **Move the Script to a Directory in `PATH`**

   To run `uhhh` from anywhere, move it to a directory that's included in your system's `PATH`.

   - **Using `/usr/local/bin`:**

     ```bash
     sudo mv uhhh /usr/local/bin/
     ```

     Ensure `~/bin` is in your `PATH`. Add the following to your shell's configuration file if needed (e.g., `~/.bashrc`, `~/.zshrc`):

     ```bash
     export PATH="$HOME/bin:$PATH"
     ```

     Reload the configuration:

     ```bash
     source ~/.bashrc  # or source ~/.zshrc
     ```

4. **Verify Installation**

   Open a new terminal window and run:

   ```bash
   uhhh -h
   ```

   You should see the help message with usage instructions.


## Usage

`uhhh` can be invoked from any directory within a Git repository.

### Options

- `-m MODEL`: **Specify the Ollama model to use.**
  **Default**: `gemma2`

- `-b BRANCH`: **Specify the Git branch to fetch commits from.**
  **Default**: Current branch

- `-n NUM_COMMITS`: **Specify the number of recent commits to fetch.**
  **Default**: `3`

- `-h`: **Display the help message.**

### Examples

1. **Basic Usage (Default: 3 Commits, Current Branch, `gemma2` Model)**

   ```bash
   uhhh
   ```

2. **Specify the Number of Commits**

   Fetch the five most recent commits.

   ```bash
   uhhh -n 5
   ```

3. **Specify a Different Ollama Model**

   Use `llama3.2` instead.

   ```bash
   uhhh -m llama3.2
   ```

4. **Specify a Different Git Branch**

   Fetch commits from the `develop` branch.

   ```bash
   uhhh -b develop
   ```

## Basic Git Commands

Git is a widely-used version control system that allows multiple people to work on the same codebase. It helps in tracking changes, collaborating with others, and reverting to previous states if necessary. Here are some fundamental Git commands:

- **`git init`**: Initializes a new Git repository. This command creates a new `.git` directory in your project, turning the current directory into a Git repository.

- **`git clone [url]`**: Creates a copy of an existing Git repository. The URL is the location of the Git repository you want to clone. E.g., `git clone https://github.com/user/repo.git`.

- **`git add [file or directory]`**: Adds files or changes in a directory to the staging area. It tells Git that you want to include updates to these files in the next commit. To add everything, use `git add .`.

- **`git commit -m "[commit message]"`**: Records or snapshots the file permanently in the version history along with a message describing the change. E.g., `git commit -m "Fixed bug in data processing"`.

- **`git status`**: Displays the state of the working directory and the staging area. It lets you see which changes have been staged, which haven't, and which files aren't being tracked by Git.

- **`git push [remote-name] [branch-name]`**: Pushes the changes in your local repository up to the remote repository you specify. E.g., `git push origin master`.

- **`git pull`**: Fetches and merges changes from the remote server to your working directory.

- **`git branch`**: Lists all the branches in your repo. Adding a branch name, like `git branch [branch-name]`, creates a new branch.

- **`git checkout [branch-name]`**: Switches to the specified branch and updates the working directory.

- **`git merge [branch]`**: Merges the specified branch’s history into the current branch.

- **`git log`**: Shows the commit logs.

- **`git diff`**: Shows the file differences not yet staged.

- **`git reset [file]`**: Unstages the file, but it preserves the file contents.

- **`git revert [commit]`**: Generates a new commit that undoes all of the changes introduced in `[commit]`, then applies it to the current branch.

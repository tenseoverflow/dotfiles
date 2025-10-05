function git_commit_helper
    # Check if we're in a git repository
    if not git rev-parse --git-dir > /dev/null 2>&1
        echo "Error: Not in a git repository"
        return 1
    end

    # Check if cursor-agent is installed
    if not command -v cursor-agent > /dev/null 2>&1
        echo "Error: cursor-agent is not installed"
        echo "Make sure Cursor is installed and cursor-agent is available"
        return 1
    end

    # Get git information
    set git_status (git status --porcelain)
    set git_diff_staged (git diff --cached --stat)
    set git_diff_unstaged (git diff --stat)
    set git_history (git log --oneline -5)
    
    # Combine all information
    set combined_info "Git Status:\n$git_status\n\nStaged Changes:\n$git_diff_staged\n\nUnstaged Changes:\n$git_diff_unstaged\n\nRecent Commit History (for style reference):\n$git_history"
    
    # Generate commit message with Cursor Agent
    echo "Generating commit message with Cursor Agent..."
    echo | cursor-agent -p "Write me ONLY a commit message for staging AND NOTHING ELSE that follows the same style and format as the recent commits shown in the git history. Use similar language patterns, capitalization, and structure. $combined_info" --output-format=text
end

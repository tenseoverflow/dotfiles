function last_history_item
    echo $history[1]
end

function last_history_token
    echo $history[1] | read -t -a tokens
    echo $tokens[-1]
end

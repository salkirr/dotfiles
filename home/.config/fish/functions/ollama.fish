function ollama
    switch $argv[1]
        case up '*'
            docker start ollama
            docker start ollama-webui
        case down
            docker rm ollama
            docker rm ollama-webui
        case 'help'
            echo 'Usage: ollama [up|down]'
    end
end

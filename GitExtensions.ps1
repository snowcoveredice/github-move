function Git-Status
{
    git status
}

function Git-AddAll-Commit-Push ([string]$commitMessage)
{
    if ([string]::IsNullOrWhitespace($commitMessage))
    {
        Write-Error "Commit message is required"
        return
    }
    git add --all
    git commit -m $commitMessage
    Git-Push
}

function Git-Push
{
    $remote = git for-each-ref --format='%(upstream:short)' $(git symbolic-ref -q HEAD)
    if ([string]::IsNullOrWhitespace($remote))
    {
        Write-Host "Creating upstream branch"
        $branch = git rev-parse --abbrev-ref HEAD
        git push -u origin $branch
    }
    else
    {
        git push
    }
}

function Git-Pull-Develop
{
    git pull origin develop
}

function Git-Feature  ([string]$feature)
{
    if ([string]::IsNullOrWhitespace($feature))
    {
        Write-Error "Feature name is required"
        return
    }
    $branch = 'feature/' + $feature
    Write-Host $"Creating new branch {$branch}"

    git fetch
    git checkout develop
    git pull
    git checkout -b $branch
}


Write-Host “- Loaded custom GIT scripts” 
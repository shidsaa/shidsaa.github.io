# Ensure that we are in the main branch
git checkout main

# Build the Jekyll website
bundle exec jekyll build

# Copy the new files into the gh-pages branch
xcopy "_site" ".." /s /e

# Switch to the gh-pages branch and clear out old files
git checkout gh-pages
Get-ChildItem -Path . -Exclude .git, .gitignore -Force | Remove-Item -Recurse -Force -ErrorAction SilentlyContinue

xcopy "..\_site" "." /s /e

# Add, commit, and push the changes to the gh-pages branch
git add --all
git commit -m "Publish website"
git push origin gh-pages

# Switch back to the main branch
git checkout main

# Print a message indicating that the deployment was successful
Write-Host "Deployment successful!"

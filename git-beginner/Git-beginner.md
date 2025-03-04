# Quickstart examples for Git beginner 

1. Create a git repository from a directory. Add and commit files, and connect to GitHub
2. Branch and merge

## Download and install Git on your working machine (Skip if alredy done in Lab prerequisites)

Download from below link and install Git on your working machine. 
- [Git download win](https://git-scm.com/download/win)

### Preparation 

But first, tell Git who you are with:

```hcl
git config --global user.name "John Doe"
git config --global user.email yourname@abc.com
```

## 1. Create a git repository from a directory. Add and commit files, and connect to GitHub

To connect local repo to Github, follow below: 

1. Go to [Github](https://github.com/)
2. Log in to your account.
3. Click the new repository button in the top-right. You’ll have an option there to initialize the repository with a README file, just ignore it. 
4. Click the “Create repository” button.

Then, go back to your command line, or terminal in VS Code, do the following: 


```hcl
mkdir testgit
```
```hcl
cd testgit
```

Create initial file 
```hcl
echo "main file created" > share-file.txt
```
```hcl
git init  
```

Before we make a commit, we must tell Git what files we want to commit (new untracked files, modified files, or deleted files). This is called staging and uses the add command. 

```hcl
git add share-file.txt   
```

Commit the file into repo  
```hcl
git commit -m "first commit"   
```

Name your first branch 
```hcl
git branch -M main   
```

Working with remote, details ref: [Git work with remote](https://git-scm.com/book/en/v2/Git-Basics-Working-with-Remotes)

```hcl
git remote add origin https://github.com/your_account/testgit.git
```
```hcl
git push -u origin main
```

View log from current git history

```hcl
git log
```

## 2. Branch and merge

```hcl
git checkout -b iss53
```

Check current branch
```hcl
git branch      
```
```hcl
echo "Editing by author of [iss53]" >> share-file.txt
```
```hcl
cat .\share-file.txt  
```

This is the staged of the file
```hcl
git add share-file.txt
```
```hcl
git commit -m "iss53 editing …"
```

Go back to main
```hcl
git checkout main       
```
Now, let's merge that iss53 branch into main. Switch back to main, to merge iss53 branch

```hcl
git branch  
```

Merge iss53 branch 
```hcl
git merge iss53    
```
```hcl
git push origin main       
```
```hcl
git branch -d iss53
```
## End of this Lab


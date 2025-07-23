# CGit

**🔧 Your Complete GitHub Workflow Automation Tools (For Windows CMD)**

---

## ⚡ What is `CGit`?

`CGit` is a custom batch script that automates the **initial GitHub repository creation** and **first commit push** — all from your local terminal.

### Features:
- Creates a new private/public GitHub repository
- Automatically adds a `README.md` and `.gitignore`
- Initializes Git locally
- Links to GitHub remote
- Pushes everything with one command

---

## 🔁 What is `PGit`?

`PGit` is your **post-creation workflow tool**. Think of it as the companion to `CGit`, made to handle regular updates to your repositories.

### Features:
- Checks for remote changes (`git fetch`)
- Prompts you before pulling
- Adds & commits your local changes
- Pushes updates to GitHub safely

---

## 🤖 Installation

### Step 1: Place the Scripts
Place both `cgit.bat` and `pgit.bat` in a permanent directory. For example:  
`C:\Scripts\GitTools`

### Step 2: Add to System PATH
1. Press `Win + S`, search for **"Edit the system environment variables"**
2. Click **"Environment Variables"**
3. Under **System Variables**, select `Path`, click **Edit**
4. Click **New**, paste your script folder path (`C:\Scripts\GitTools`)
5. Hit **OK** on all dialogs

You're done. You can now use `cgit` and `pgit` from **any terminal**.

---

## 🚀 How to Use

### 📦 To Create a New Repo
1. Place your project in a folder (or create one)
2. Open CMD in that folder
3. Run:

```bash
cgit
```
4. Fill in the prompts and let the magic happen.

## 🔁 To Push Changes Later
After making changes to your repo:
1. Open CMD in the project folder
2. Run:
```
pgit
```
3. Follow the prompts to pull (if needed), commit, and push.

## 🧠 Notes
- Ensure Git is installed and configured (git config --global user.name etc.)
- Ensure that you have GitHub CLI installed and authenticated.